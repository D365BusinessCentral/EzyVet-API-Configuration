page 50002 EzyvetOwnershipID
{

    ApplicationArea = All;
    Caption = 'Ezyvet Ownership ID';
    PageType = List;
    SourceTable = EzyVetSeperation;
    UsageCategory = Lists;
    SourceTableView = where(active = const('1'));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the id field';
                    ApplicationArea = All;

                }
                field(active; Rec.active)
                {
                    ToolTip = 'Specifies the value of the active field';
                    ApplicationArea = All;
                }
                field(name; Rec.name)
                {
                    ToolTip = 'Specifies the value of the name field';
                    ApplicationArea = All;
                }
                field(type; Rec.type)
                {
                    ToolTip = 'Specifies the value of the type field';
                    ApplicationArea = All;
                }
                field(parent; Rec.parent)
                {
                    ToolTip = 'Specifies the value of the parent field';
                    ApplicationArea = All;
                }
                field(created_at; Rec.created_at)
                {
                    ToolTip = 'Specifies the value of the created_at field';
                    ApplicationArea = All;
                }
                field(modified_at; Rec.modified_at)
                {
                    ToolTip = 'Specifies the value of the modified_at field';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(GetOwnershipId)
            {
                Caption = 'Get Ownership ID';
                ApplicationArea = All;
                Image = GetLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    EzyvetSeperation: Codeunit EzyVetUpdateSeperationDetails;
                begin
                    Clear(EzyvetSeperation);
                    EzyvetSeperation.Run();
                    Message('Ownership details updated');
                    CurrPage.Update();
                end;
            }

        }
    }
}
