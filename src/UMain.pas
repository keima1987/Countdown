unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, XPMan, ExtCtrls, StdCtrls,Math, Spin, Dateutils;

type
  TfrmCountdown = class(TForm)
    bdDate: TDateTimePicker;
    tmCountdown: TTimer;
    XPManifest1: TXPManifest;
    lblDate: TLabel;
    lblCountdown: TLabel;
    bdTime: TDateTimePicker;
    lblTime: TLabel;
    btnStartStop: TButton;
    rgMode: TRadioGroup;
    speHours: TSpinEdit;
    speMin: TSpinEdit;
    speSec: TSpinEdit;
    lblHours: TLabel;
    lblMin: TLabel;
    lblSec: TLabel;
    btnReset: TButton;
    procedure tmCountdownTimer(Sender: TObject);
    procedure btnStartStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbCounterClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCountdown: TfrmCountdown;
  NewDate:TDateTime;

implementation

{$R *.dfm}

procedure Wait(time: word);
var Start: Integer;
begin
  Start:=GetTickCount;
  while GetTickCount-Start <= time do
    application.ProcessMessages;
end;

procedure TfrmCountdown.tmCountdownTimer(Sender: TObject);
var selected: TDateTime;
    Difference: extended;
begin
    //if rgMode.ItemIndex = 2 then
    case rgMode.ItemIndex of
    2:
    begin
      bdDate.Time:=bdTime.Time;   //copy Time to Date
      selected:=bdDate.Date;
      Difference:=selected-now;
      lblCountdown.Caption:=inttostr(Trunc(Difference))+'.'+FormatDateTime('hh:nn:ss.zzz', Difference);
    end;
    0:
    begin
      bdDate.Time:=bdTime.Time;   //copy Time to Date
      selected:=bdDate.Date;
      Difference:=selected-now;
      SetRoundMode(rmTruncate);
      lblCountdown.Caption:=inttostr(Trunc(Difference))+'.'+FormatDateTime('hh:nn:ss', Difference)+'.---';
      if difference <= 0 then
      begin
       tmCountdown.Enabled:=false;
       lblCountdown.Caption:='Time Up';
       btnStartStop.Caption := '&Start';
       bdDate.Enabled:=true;
       bdTime.Enabled:=true;
       rgMode.Enabled:=true;
       btnReset.Enabled:=true;
      end;
    end;
    1:begin
      selected:=NewDate;
      Difference:=selected-now;
      SetRoundMode(rmTruncate);
      lblCountdown.Caption:=inttostr(Trunc(Difference))+'.'+FormatDateTime('hh:nn:ss', Difference)+'.---';
      if difference <= 0 then
      begin
       tmCountdown.Enabled:=false;
       lblCountdown.Caption:='Time Up';
       btnStartStop.Caption := '&Start';
       speHours.Enabled:=true;
       speMin.Enabled:=true;
       speSec.Enabled:=true;
       rgMode.Enabled:=true;
       btnReset.Enabled:=true;
      end;
    end;
end;
end;

procedure TfrmCountdown.btnStartStopClick(Sender: TObject);
var selected: TDateTime;
    Difference: extended;
    Year,Month,Day,Hour,Min,Sec,MilliSec:word;
begin
  //if rgMode.ItemIndex = 2 then
  case rgMode.ItemIndex of
  2:
  begin
    if btnStartStop.Caption = '&Start' then
    begin
     tmCountdown.Enabled:=true;
     btnStartStop.Caption := '&Stop';
     rgMode.Enabled:=false;
     bdDate.DateTime:=now;
     bdTime.DateTime:=now;
     btnReset.Enabled:=false;
    end
   else
    begin
     tmCountdown.Enabled:=false;
     btnStartStop.Caption := '&Start';
     rgMode.Enabled:=true;
     btnReset.Enabled:=true;
    end;
  end;
  0:
  begin
    if btnStartStop.Caption = '&Start' then
    begin
      bdDate.Time:=bdTime.Time;   //copy Time to Date
      selected:=bdDate.Date;
      Difference:=selected-now;
      if difference < 0 then
      begin
        lblCountdown.Caption:='Invalid Input';
        wait(2000);
        lblCountdown.Caption:='-.--:--:--.---';
      end
      else
      begin
       tmCountdown.Enabled:=true;
       btnStartStop.Caption := '&Stop';
       bdDate.Enabled:=false;
       bdTime.Enabled:=false;
       rgMode.Enabled:=false;
       btnReset.Enabled:=false;
     end;
    end
    else
    begin
     tmCountdown.Enabled:=false;
     btnStartStop.Caption := '&Start';
     bdDate.Enabled:=true;
     bdTime.Enabled:=true;
     rgMode.Enabled:=true;
     btnReset.Enabled:=true;
    end;
  end;
  1:
  begin
    if btnStartStop.Caption = '&Start' then
    begin
      selected:=now;
      DecodeTime(selected,Hour,Min,Sec,MilliSec);
      DecodeDate(selected,Year,Month,Day);
      Hour:=Hour+speHours.Value;
      Min:=Min+speMin.Value;
      Sec:=Sec+speSec.Value+1;
      if Sec > 59 then
        begin
          Min := Min + 1;
          Sec := Sec - 59;
        end;
      if Min > 59 then
        begin
          Hour := Hour + 1;
          Min := Min - 59;
        end;
      if Hour > 23 then
        begin
          Day := Day + 1;
          Hour := Hour - 24;
      end;
      case Month of
      1: if Day > 31 then begin Month := Month + 1; Day := Day - 31; end;
      2: if IsLeapYear(Year) then if Day > 29 then begin Month := Month + 1; Day := Day - 29; end else if Day > 28 then begin Month := Month + 1; Day := Day - 28; end;
      3: if Day > 31 then begin Month := Month + 1; Day := Day - 31; end;
      4: if Day > 30 then begin Month := Month + 1; Day := Day - 30; end;
      5: if Day > 31 then begin Month := Month + 1; Day := Day - 31; end;
      6: if Day > 30 then begin Month := Month + 1; Day := Day - 30; end;
      7: if Day > 31 then begin Month := Month + 1; Day := Day - 31; end;
      8: if Day > 31 then begin Month := Month + 1; Day := Day - 31; end;
      9: if Day > 30 then begin Month := Month + 1; Day := Day - 30; end;
      10: if Day > 31 then begin Month := Month + 1; Day := Day - 31; end;
      11: if Day > 30 then begin Month := Month + 1; Day := Day - 30; end;
      12: if Day > 31 then begin Month := Month + 1; Day := Day - 31; end;
      end;
      if Month > 12 then begin Year := Year + 1; Month := Month - 12; end;
      selected:=RecodeTime(selected,Hour,Min,Sec,MilliSec);
      selected:=RecodeDate(selected,Year,Month,Day);
      NewDate:=selected;
      Difference:=selected-now;
      if difference < 0 then
      begin
        lblCountdown.Caption:='Invalid Input';
        wait(2000);
        lblCountdown.Caption:='-.--:--:--.---';
      end

      else
      begin
       tmCountdown.Enabled:=true;
       btnStartStop.Caption := '&Stop';
       speHours.Enabled:=false;
       speMin.Enabled:=false;
       speSec.Enabled:=false;
       rgMode.Enabled:=false;
       btnReset.Enabled:=false;
     end;
    end
    else
    begin
     tmCountdown.Enabled:=false;
     btnStartStop.Caption := '&Start';
       speHours.Enabled:=true;
       speMin.Enabled:=true;
       speSec.Enabled:=true;
       rgMode.Enabled:=true;
       btnReset.Enabled:=true;
    end;
  end;
  end;
end;

procedure TfrmCountdown.FormCreate(Sender: TObject);
begin
   bdDate.DateTime:=now;
   bdTime.DateTime:=now;
end;

procedure TfrmCountdown.cbCounterClick(Sender: TObject);
begin
  case rgMode.ItemIndex of
  0:begin
     bdDate.Enabled:=true;
     bdTime.Enabled:=true;
     speHours.Enabled:=false;
     speMin.Enabled:=false;
     speSec.Enabled:=false;
     lblCountdown.Caption:='-.--:--:--.---';
  end;
  1:begin
     bdDate.Enabled:=false;
     bdTime.Enabled:=false;
     speHours.Enabled:=true;
     speMin.Enabled:=true;
     speSec.Enabled:=true;
     lblCountdown.Caption:='-.--:--:--.---';
  end;
  2:begin
     bdDate.Enabled:=false;
     bdTime.Enabled:=false;
     speHours.Enabled:=false;
     speMin.Enabled:=false;
     speSec.Enabled:=false;
     lblCountdown.Caption:='-.--:--:--.---';
  end;
  end;
end;

procedure TfrmCountdown.btnResetClick(Sender: TObject);
begin
  lblCountdown.Caption:='-.--:--:--.---';
end;

end.
