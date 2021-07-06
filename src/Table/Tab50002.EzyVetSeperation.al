table 50002 EzyVetSeperation
{
    Caption = 'EzyVet Seperation';
    DataClassification = CustomerContent;
    LookupPageId = EzyvetOwnershipID;

    fields
    {
        field(1; id; Text[100])
        {
            Caption = 'id';
            DataClassification = CustomerContent;
        }
        field(2; active; Text[10])
        {
            Caption = 'active';
            DataClassification = CustomerContent;
        }
        field(3; created_at; Text[30])
        {
            Caption = 'created_at';
            DataClassification = CustomerContent;
        }
        field(4; modified_at; Text[30])
        {
            Caption = 'modified_at';
            DataClassification = CustomerContent;
        }
        field(5; name; Text[200])
        {
            Caption = 'name';
            DataClassification = CustomerContent;
        }
        field(6; type; Text[50])
        {
            Caption = 'type';
            DataClassification = CustomerContent;
        }
        field(7; parent; Text[30])
        {
            Caption = 'parent';
            DataClassification = CustomerContent;
        }
        field(8; limit; Text[20])
        {
            Caption = 'limit';
            DataClassification = CustomerContent;
        }
        field(9; page; Text[20])
        {
            Caption = 'page';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; id, name)
        {

        }
    }

}
