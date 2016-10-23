program AobControl;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uCadPassaros in 'uCadPassaros.pas' {frmPassaros},
  uCadProprietarios in 'uCadProprietarios.pas' {frmProprietarios},
  uCadCompetidores in 'uCadCompetidores.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmPassaros, frmPassaros);
  Application.CreateForm(TfrmProprietarios, frmProprietarios);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
