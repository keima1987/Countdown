program Countdown;

uses
  Forms,
  UMain in 'UMain.pas' {frmCountdown};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCountdown, frmCountdown);
  Application.Run;
end.
