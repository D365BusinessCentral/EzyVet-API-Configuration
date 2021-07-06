codeunit 50001 "EzyVet GenerateAccessToken"
{
    procedure GenerateAccessToken()
    var
        APIConfiguration: Record "EzyVet API Configuration";
    begin
        APIConfiguration.Get();
        APIConfiguration.TestField(partner_id);
        APIConfiguration.TestField(client_id);
        APIConfiguration.TestField(client_secret);
        APIConfiguration.TestField(grant_type);
        APIConfiguration.TestField(scope);
        APIConfiguration.TestField(access_token_endpoint_url);

        gbodyContent := StrSubstNo('partner_id=%1&client_id=%2&client_secret=%3&grant_type=%4&scope=%5',
                        APIConfiguration.partner_id, APIConfiguration.client_id, APIConfiguration.client_secret,
                        APIConfiguration.grant_type, APIConfiguration.scope);
        gHttpcontent.WriteFrom(gbodyContent);
        gHttpcontent.GetHeaders(gHttpheaders);
        gHttpheaders.Remove('Content-Type');
        gHttpHeaders.Add('Content-Type', 'application/x-www-form-urlencoded');
        if gHttpclient.Post(APIConfiguration.access_token_endpoint_url, gHttpcontent, ghttpResponseMessage) then begin
            ghttpResponseMessage.Content.ReadAs(gresponseText);
            gJSONToken.ReadFrom(gresponseText);
            gJSONObject := gJSONToken.AsObject();
            APIConfiguration.access_token := GetJSONToken(gJSONObject, 'access_token').AsValue().AsText();
            APIConfiguration.Modify();
            Message('Access Token Retrieved');
        end else
            Error(FORMAT(ghttpResponseMessage.Content));

    end;

    local procedure GetJSONToken(JsonObject: JsonObject;
    TokenKey: Text) JsonToken: JsonToken;
    var
    begin
        if not JsonObject.get(TokenKey, JsonToken) then Error('Could not find a token with key %1', TokenKey);
    end;

    var
        ghttpClient: HttpClient;
        ghttpContent: HttpContent;
        ghttpHeaders: HttpHeaders;
        ghttpRequestMessage: HttpRequestMessage;
        ghttpResponseMessage: HttpResponseMessage;
        gbodyContent: Text;
        gresponseText: Text;
        gJSONToken: JsonToken;
        gJSONObject: JsonObject;
}
