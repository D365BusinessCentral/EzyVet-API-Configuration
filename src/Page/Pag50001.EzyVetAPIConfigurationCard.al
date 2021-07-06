page 50001 "EzyVet API Configuration Card"
{

    Caption = 'EzyVet API Configuration Card';
    PageType = Card;
    SourceTable = "EzyVet API Configuration";
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field';
                    ApplicationArea = All;
                }
                field(client_id; Rec.client_id)
                {
                    ToolTip = 'Specifies the value of the client_id field';
                    ApplicationArea = All;
                }
                field(client_secret; Rec.client_secret)
                {
                    ToolTip = 'Specifies the value of the client_secret field';
                    ApplicationArea = All;
                }
                field(grant_type; Rec.grant_type)
                {
                    ToolTip = 'Specifies the value of the grant_type field';
                    ApplicationArea = All;
                }
                field(partner_id; Rec.partner_id)
                {
                    ToolTip = 'Specifies the value of the partner_id field';
                    ApplicationArea = All;
                }
                field(scope; Rec.scope)
                {
                    ToolTip = 'Specifies the value of the scope field';
                    ApplicationArea = All;
                }
                field(access_token; Rec.access_token)
                {
                    ToolTip = 'Specifies the value of the access_token';
                    ApplicationArea = all;
                    ExtendedDatatype = Masked;
                }

            }
            group(Endpoints)
            {
                field(access_token_endpoint_url; rec.access_token_endpoint_url)
                {
                    ToolTip = 'Specifies the value of the Access token endpoint';
                    ApplicationArea = all;

                }
                field(seperation_endpoint_url; rec.seperation_endpoint_url)
                {
                    ToolTip = 'Specifies the value of the Seperation endpoint';
                    ApplicationArea = all;

                }
                field(contact_endpoint_url; rec.contact_endpoint_url)
                {
                    ToolTip = 'Specifies the value of the contact endpoint';
                    ApplicationArea = all;
                }
                field(address_endpoint_url; rec.address_endpoint_url)
                {
                    ToolTip = 'Specifies the value of the Address endpoint';
                    ApplicationArea = all;

                }
                field(country_endpoint_url; rec.country_endpoint_url)
                {

                    ToolTip = 'Specifies the value of the Country endpoint';
                    ApplicationArea = all;
                }
                field(tag_endpoint_url; rec.tag_endpoint_url)
                {
                    ToolTip = 'Specifies the value of the tag endpoint';
                    ApplicationArea = all;
                }
                field(product_endpoint_url; rec.product_endpoint_url)
                {
                    ToolTip = 'Specifies the value of the product endpoint';
                    ApplicationArea = all;
                }
                field(invoice_url; rec.invoice_url)
                {
                    ToolTip = 'Specifies the value of the invoice endpoint';
                    ApplicationArea = all;

                }
                field(invoice_line_url; rec.invoice_line_url)
                {
                    ToolTip = 'Specifies the value of the invoice lines endpoint';
                    ApplicationArea = all;

                }
                field(payment_url; rec.payment_url)
                {
                    ToolTip = 'Specifies the value of the payment endpoint';
                    ApplicationArea = all;
                }

            }
            group(Setups)
            {
                Caption = 'Setups';
                field("Ownership ID"; rec."Ownership ID")
                {
                    ToolTip = 'Specifies the value of the Ownership Id';
                    ApplicationArea = all;

                }

                field("Default Customer Template"; rec."Default Customer Template")
                {
                    ToolTip = 'Specifies the value of the Customer Template';
                    ApplicationArea = all;

                }
                field("Dispense Account"; rec."Dispense Account")
                {
                    ToolTip = 'Specifies the value of the Dispense Account';
                    ApplicationArea = all;

                }
                field("Payment Journal Template"; rec."Payment Journal Template")
                {
                    ToolTip = 'Specifies the value of the Payment Journal Template';
                    ApplicationArea = all;

                }
                field("Payment Journal Batch"; rec."Payment Journal Batch")
                {
                    ToolTip = 'Specifies the value of the Payment Journal Batch';
                    ApplicationArea = all;

                }
            }
            group("retrieval dates")
            {
                Caption = 'Last Retrieval Dates';
                field(last_contact_retrieval_date; rec.last_contact_retrieval_date)
                {
                    ToolTip = 'Specifies the value of the last contact date';
                    ApplicationArea = all;
                    //Editable = false;
                }

                field(last_address_retrieval_date; rec.last_address_retrieval_date)
                {
                    ToolTip = 'Specifies the value of the last address date';
                    ApplicationArea = all;
                    //Editable = false;
                }
                field(last_country_retrieval_date; rec.last_country_retrieval_date)
                {
                    ToolTip = 'Specifies the value of the last country date';
                    ApplicationArea = all;
                    //Editable = false;
                }
                field(last_product_retrieval_date; rec.last_product_retrieval_date)
                {
                    ToolTip = 'Specifies the value of the last_product_retrieval_date';
                    ApplicationArea = all;
                    //Editable = false;
                }
                field(last_invoice_retrieval_date; rec.last_invoice_retrieval_date)
                {
                    ToolTip = 'Specifies the value of the last_invoice_retrieval_date';
                    ApplicationArea = all;
                    //Editable = false;
                }
                field(last_payment_retrieval_date; rec.last_payment_retrieval_date)
                {
                    ToolTip = 'Specifies the value of the last_payment_retrieval_date';
                    ApplicationArea = all;
                    //Editable = false;
                }
                field(last_tag_retrieval_date; rec.last_tag_retrieval_date)
                {
                    ToolTip = 'Specifies the value of the last_tag_retrieval_date';
                    ApplicationArea = all;
                }

            }

        }

    }
    actions
    {
        area(Processing)
        {
            action(GenerateAccessToken)
            {
                Caption = 'Generate Access Token';
                Image = Web;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    GetAccessToken: Codeunit "EzyVet GenerateAccessToken";
                begin
                    GetAccessToken.GenerateAccessToken();
                end;
            }

            action(ConvertEpochDateTime)
            {
                Caption = 'Convert Epoch date time';
                Image = Calendar;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;

                trigger OnAction()
                var
                    EpochConvertor: Codeunit "EzyVet Epoch Convertor";
                begin
                    MESSAGE('Date Time for Epoch Time %1 is %2', '1621948549', FORMAT(EpochConvertor.EpochDateTimeToSystemDateTime(1621948549)));
                end;
            }
            action(ConvertSystemDateTime)
            {
                Caption = 'Convert system date time';
                Image = Calendar;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;

                trigger OnAction()
                var
                    EpochConvertor: Codeunit "EzyVet Epoch Convertor";
                begin
                    MESSAGE('Epoch Time for Date %1 is %2', CurrentDateTime, EpochConvertor.SystemDateTimeToEpochDateTime(CurrentDateTime));
                end;
            }

        }
    }
}
