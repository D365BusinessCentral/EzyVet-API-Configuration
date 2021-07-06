codeunit 50002 "EzyVet Epoch Convertor"
{
    trigger OnRun()
    begin

    end;

    procedure SystemDateTimeToEpochDateTime(lSystemDateTime: DateTime) lEpochTime: Integer;
    var
        lEpochStartDate: DateTime;
        lvDuration: Decimal;
        lDays: Decimal;
        lSeconds: Decimal;
        lHours: Decimal;
        lMins: Decimal;
        lSecs: Decimal;

    begin
        lEpochStartDate := CreateDateTime(19700101D, 000000T);
        lvDuration := lSystemDateTime - lEpochStartDate;
        // Convert the Duration to Days, Hours, Minutes, and Seconds. Milliseconds? 
        lvDuration := lvDuration / 1000;
        lDays := ROUND((lvDuration / 86400), 1, '<');
        lHours := ROUND(((lvDuration - (lDays * 86400)) / 3600), 1, '<');
        lMins := ROUND(((lvDuration - (lDays * 86400) - (lHours * 3600)) / 60), 1, '<');
        lSecs := ROUND(((lvDuration - (lDays * 86400) - (lHours * 3600) - (lMins * 60))), 1, '<');
        // Get Epoch Time
        lEpochTime := ((lDays * 86400) + (lHours * 3600) + (lMins * 60) + lSecs) - (9 * 3600);
        exit(lEpochTime);
    end;

    procedure EpochDateTimeToSystemDateTime(lEpochValue: Integer) lDateTime: DateTime
    var
        lEpochDate: Date;
        lDate: Date;
        lTime: Time;
        lTimeTxt: Text;
        lNoofDays: Decimal;
        lNoofHours: Decimal;
        lNoofMins: Decimal;
        lNoofSeconds: Decimal;
        lRoundedNoOfDays: Integer;
        lDaysDifference: Decimal;
        lRoundedHours: Integer;
        lHoursDifference: Decimal;
        lRoundedMins: Integer;
        lMinsDifference: Decimal;
        lRoundedSecs: Integer;
    begin
        lEpochValue := lEpochValue + (8 * 3600);
        lEpochDate := 19700101D;

        lNoofDays := (lEpochValue / 86400);
        lRoundedNoOfDays := ROUND(lNoofDays, 1, '<');
        lDate := lEpochDate + lRoundedNoOfDays;

        lDaysDifference := lNoofDays - lRoundedNoofDays;
        lNoofHours := lDaysDifference * 24;
        lRoundedHours := Round(lNoofHours, 1, '<');

        lHoursDifference := lNoofHours - lRoundedHours;
        lNoofMins := lHoursDifference * 60;
        lRoundedMins := Round(lNoofMins, 1, '<');

        lMinsDifference := lNoofMins - lRoundedMins;
        lNoofSeconds := lMinsDifference * 60;
        lRoundedSecs := Round(lNoofSeconds, 1, '<');
        //lTimeTxt := Format(lRoundedHours) + Format(lRoundedMins) + Format(lRoundedSecs);
        if StrLen(Format(lRoundedHours)) < 2 then
            lTimeTxt := '0' + Format(lRoundedHours);
        if StrLen(Format(lRoundedMins)) < 2 then
            lTimeTxt += '0' + Format(lRoundedMins);
        if StrLen(Format(lRoundedSecs)) < 2 then
            lTimeTxt += '0' + Format(lRoundedSecs);

        Evaluate(lTime, lTimeTxt);
        Exit(CreateDateTime(lDate, lTime));
    end;


}