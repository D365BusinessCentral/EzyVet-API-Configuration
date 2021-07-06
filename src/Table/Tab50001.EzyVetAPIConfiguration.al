table 50001 "EzyVet API Configuration"
{
    Caption = 'EzyVet API Configuration';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; partner_id; Text[100])
        {
            Caption = 'partner_id';
            DataClassification = CustomerContent;
        }
        field(3; client_id; Text[100])
        {
            Caption = 'client_id';
            DataClassification = CustomerContent;
        }
        field(4; client_secret; Text[100])
        {
            Caption = 'client_secret';
            DataClassification = CustomerContent;
        }
        field(5; grant_type; Text[100])
        {
            Caption = 'grant_type';
            DataClassification = CustomerContent;
        }
        field(6; scope; Text[1000])
        {
            Caption = 'scope';
            DataClassification = CustomerContent;
        }
        field(7; access_token; Text[200])
        {
            Caption = 'access_token';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(8; access_token_endpoint_url; Text[200])
        {
            Caption = 'Access Token Endpoint URL';
            DataClassification = CustomerContent;
        }
        field(9; contact_endpoint_url; Text[200])
        {
            Caption = 'Contact Endpoint URL';
            DataClassification = CustomerContent;
        }
        field(10; product_endpoint_url; Text[200])
        {
            Caption = 'Product Endpoint URL';
            DataClassification = CustomerContent;
        }
        field(11; invoice_url; Text[200])
        {
            Caption = 'Invoice Endpoint URL';
            DataClassification = CustomerContent;
        }
        field(12; invoice_line_url; Text[200])
        {
            Caption = 'Invoice Lines Endpoint URL';
            DataClassification = CustomerContent;
        }

        field(13; payment_url; Text[200])
        {
            Caption = 'Payment Endpoint URL';
            DataClassification = CustomerContent;
        }
        field(14; last_contact_retrieval_date; Integer)
        {
            Caption = 'last_contact_retrieval date';
            DataClassification = CustomerContent;
        }
        field(15; address_endpoint_url; Text[200])
        {
            Caption = 'Address_endpoint_url';
            DataClassification = CustomerContent;

        }
        field(16; country_endpoint_url; Text[200])
        {
            Caption = 'Country_endpoint_url';
            DataClassification = CustomerContent;

        }
        field(17; last_address_retrieval_date; Integer)
        {
            Caption = 'last_address_retrieval date';
            DataClassification = CustomerContent;
        }
        field(18; last_country_retrieval_date; Integer)
        {
            Caption = 'last_country_retrieval date';
            DataClassification = CustomerContent;
        }
        field(19; "Default Customer Template"; Code[20])
        {
            Caption = 'Default Customer Template';
            DataClassification = CustomerContent;
            TableRelation = "Customer Templ.";
        }
        field(20; last_product_retrieval_date; Integer)
        {
            Caption = 'last_product_retrieval_date';
            DataClassification = CustomerContent;
        }
        field(21; last_invoice_retrieval_date; Integer)
        {
            Caption = 'last_invoice_retrieval_date';
            DataClassification = CustomerContent;
        }
        field(22; last_payment_retrieval_date; Integer)
        {
            Caption = 'last_payment_retrieval_date';
            DataClassification = CustomerContent;
        }
        field(23; "Dispense Account"; Code[20])
        {
            Caption = 'Dispense Account';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account" where("Account Type" = const(Posting));
        }
        field(24; "Payment Journal Template"; Code[20])
        {
            Caption = 'Payment Journal Template';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Template";
        }
        field(25; "Payment Journal Batch"; Code[20])
        {
            Caption = 'Payment Journal Batch';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Payment Journal Template"));
        }
        field(26; seperation_endpoint_url; Text[200])
        {
            Caption = 'Seperation Endpoint URL';
            DataClassification = CustomerContent;
        }
        field(27; "Ownership ID"; Text[100])
        {
            Caption = 'Ownership Id';
            TableRelation = EzyVetSeperation.id;
            DataClassification = CustomerContent;
        }
        field(28; tag_endpoint_url; Text[200])
        {
            Caption = 'Tag Endpoint URL';
            DataClassification = CustomerContent;
        }
        field(29; last_tag_retrieval_date; Integer)
        {
            Caption = 'last_tag_retrieval_date';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}
