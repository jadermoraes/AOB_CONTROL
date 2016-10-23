unit uCadProprietarios;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation,FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmProprietarios = class(TForm)
    pnl2: TPanel;
    Label1: TLabel;
    ednmpassaro: TEdit;
    Nome: TLabel;
    Gravar: TButton;
    procedure GravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProprietarios: TfrmProprietarios;

implementation

uses uPrincipal;

{$R *.fmx}

procedure TfrmProprietarios.GravarClick(Sender: TObject);
 var qr: TFDQuery;
begin
  qr := TFDQuery.Create(nil);

  try
    Form1.Transaction.StartTransaction;
    qr.Connection := Form1.Conexao;
    qr.SQL.Add(' insert into passaros (nm_proprietario) ');
    qr.SQL.Add(' Values ');
    qr.SQL.Add(' ('+ ednmpassaro.Text+', (select id from proprietario ');
    qr.SQL.Add(' where nm_proprietario = '+QuotedStr(ComboBox1.Selected.Text)+' ))');
    qr.ExecSQL;
    Form1.Transaction.CommitRetaining;
  except
     on E : Exception do
     begin
       Form1.Transaction.RollbackRetaining;
       raise Exception.Create(e.message);
     end;
  end;

end;

end.
