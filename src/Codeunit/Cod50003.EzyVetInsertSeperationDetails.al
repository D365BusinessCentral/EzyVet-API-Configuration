codeunit 50003 EzyVetUpdateSeperationDetails
{
    trigger OnRun()
    begin
        CheckSetup();
        GenerateAccessToken();
        GetSeperationList();
    end;

    procedure CheckSetup()
    begin
        APIConfiguration.Get();
        APIConfiguration.TestField(partner_id);
        APIConfiguration.TestField(client_id);
        APIConfiguration.TestField(client_secret);
        APIConfiguration.TestField(grant_type);
        APIConfiguration.TestField(scope);
        APIConfiguration.TestField(access_token_endpoint_url);
        APIConfiguration.TestField(seperation_endpoint_url);
    end;

    procedure GenerateAccessToken()
    var
        lhttpClient: HttpClient;
        lhttpContent: HttpContent;
        lhttpHeaders: HttpHeaders;
        lhttpRequestMessage: HttpRequestMessage;
        lhttpResponseMessage: HttpResponseMessage;
        lbodyContent: Text;
        lresponseText: Text;
        lJSONToken: JsonToken;
        lJSONObject: JsonObject;
    begin


        lbodyContent := StrSubstNo('partner_id=%1&client_id=%2&client_secret=%3&grant_type=%4&scope=%5',
                        APIConfiguration.partner_id, APIConfiguration.client_id, APIConfiguration.client_secret,
                        APIConfiguration.grant_type, APIConfiguration.scope);
        lHttpcontent.WriteFrom(lbodyContent);
        lHttpcontent.GetHeaders(lHttpheaders);
        lHttpheaders.Remove('Content-Type');
        lHttpHeaders.Add('Content-Type', 'application/x-www-form-urlencoded');
        if lHttpclient.Post(APIConfiguration.access_token_endpoint_url, lHttpcontent, lhttpResponseMessage) then begin
            lhttpResponseMessage.Content.ReadAs(lresponseText);
            lJSONToken.ReadFrom(lresponseText);
            lJSONObject := lJSONToken.AsObject();
            gAccessToken := GetJSONToken(lJSONObject, 'access_token').AsValue().AsText();
        end else
            Error(FORMAT(lhttpResponseMessage.Content));

    end;

    procedure GetSeperationList()
    var
        lhttpClient: HttpClient;
        lhttpContent: HttpContent;
        lhttpHeaders: HttpHeaders;
        lhttpResponseMessage: HttpResponseMessage;
        lresponseText: Text;
        lFilters: Text;
        i: Integer;
        j: Integer;
        lRecordsCount: Integer;

    begin
        i := 0;
        j += 1;
        i += 1;
        lFilters := 'limit=200&';
        Clear(lhttpContent);
        Clear(lhttpClient);
        Clear(lhttpResponseMessage);
        Clear(lresponseText);
        lhttpClient.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + FORMAT(gAccessToken));
        if lhttpClient.Get(APIConfiguration.seperation_endpoint_url + lFilters, lhttpResponseMessage) then begin
            lhttpResponseMessage.Content.ReadAs(lresponseText);
            InsertSeperation(lresponseText);
        end else
            Error(FORMAT(lhttpResponseMessage.Content));

    end;

    procedure InsertSeperation(lJSONText: Text)
    var
        lEzyVetSeperation: Record EzyVetSeperation;
        lJSONObject: JsonObject;
        lJSONToken: JsonToken;
        lJSONArray: JsonArray;
        i: Integer;
        j: Integer;
        lEntryNo: Integer;
    begin
        j := 0;
        lEntryNo := 0;

        lJSONToken.ReadFrom(lJSONText);
        lJSONObject := lJSONToken.AsObject();
        lJSONToken.SelectToken('items', lJSONToken);
        lJSONArray := lJSONToken.AsArray();
        //Process JSON response
        for i := 0 to lJSONArray.Count - 1 do begin
            j += 1;
            lJSONArray.Get(i, lJSONToken);
            lJSONToken.SelectToken('separation', lJSONToken);
            lJSONObject := lJSONToken.AsObject();
            lEzyVetSeperation.Reset();
            lEzyVetSeperation.SetRange(id, GetJSONToken(lJSONObject, 'id').AsValue().AsText());
            if not lEzyVetSeperation.FindFirst() then begin
                lEntryNo += 1;
                lEzyVetSeperation.Init();
                lEzyVetSeperation.id := GetJSONToken(lJSONObject, 'id').AsValue().AsText();
                lEzyVetSeperation.Insert();
            end;
            lEzyVetSeperation.active := GetJSONToken(lJSONObject, 'active').AsValue().AsText();
            lEzyVetSeperation.created_at := GetJSONToken(lJSONObject, 'created_at').AsValue().AsText();
            lEzyVetSeperation.modified_at := GetJSONToken(lJSONObject, 'modified_at').AsValue().AsText();
            lEzyVetSeperation.name := GetJSONToken(lJSONObject, 'name').AsValue().AsText();
            lEzyVetSeperation.type := GetJSONToken(lJSONObject, 'type').AsValue().AsText();
            lEzyVetSeperation.parent := GetJSONToken(lJSONObject, 'parent').AsValue().AsText();
            //lEzyVetSeperation.limit := GetJSONToken(lJSONObject, 'limit').AsValue().AsText();
            //lEzyVetSeperation.page := GetJSONToken(lJSONObject, 'page').AsValue().AsText();
            lEzyVetSeperation.Modify();
        end;
    end;

    local procedure GetJSONToken(JsonObject: JsonObject;
    TokenKey: Text) JsonToken: JsonToken;
    var
    begin
        if not JsonObject.get(TokenKey, JsonToken) then Error('Could not find a token with key %1', TokenKey);
    end;

    var
        APIConfiguration: Record "EzyVet API Configuration";
        gAccessToken: Text;

}
