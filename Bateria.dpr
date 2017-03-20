program Bateria;

uses
  Forms,
  Windows,
  uMain in 'uMain.pas' {frmBateria},
  uPropriedades in 'uPropriedades.pas' {frmPropriedades};

{$R *.res}

var
  ExtendedStyle : Integer;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;

  ExtendedStyle := GetWindowLong(Application.Handle, gwl_ExStyle);
  SetWindowLong(Application.Handle, gwl_ExStyle, ExtendedStyle or
    ws_Ex_ToolWindow and not ws_Ex_AppWindow);

  Application.CreateForm(TfrmBateria, frmBateria);
  Application.CreateForm(TfrmPropriedades, frmPropriedades);
  Application.Run;
end.
