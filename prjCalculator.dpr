program prjCalculator;

uses
  Vcl.Forms,
  untCalculator in 'untCalculator.pas' {frmCalculator},
  untClassCalculator in 'untClassCalculator.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalculator, frmCalculator);
  Application.Run;
end.
