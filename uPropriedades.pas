unit uPropriedades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, Buttons, Mask;

type
  TfrmPropriedades = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ColorDialogHigh: TColorDialog;
    pnlMid: TPanel;
    pnlLow: TPanel;
    ColorDialogMid: TColorDialog;
    ColorDialoglow: TColorDialog;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label4: TLabel;
    pnlFundo: TPanel;
    Shape4: TShape;
    ColorDialogFundo: TColorDialog;
    btnDefinir: TSpeedButton;
    pnlHigh: TPanel;
    procedure pnlHighClick(Sender: TObject);
    procedure pnlMidClick(Sender: TObject);
    procedure pnlLowClick(Sender: TObject);
    procedure pnlFundoClick(Sender: TObject);
    procedure btnDefinirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropriedades: TfrmPropriedades;

implementation

uses uMain;

{$R *.dfm}

procedure TfrmPropriedades.FormShow(Sender: TObject);
begin
  frmBateria.tmr1.Enabled := False;
end;

procedure TfrmPropriedades.pnlFundoClick(Sender: TObject);
begin
  ColorDialogFundo.Execute;
  pnlFundo.Color := ColorDialogFundo.Color;
end;

procedure TfrmPropriedades.pnlHighClick(Sender: TObject);
begin
  ColorDialogHigh.Execute;
  pnlHigh.Color := ColorDialogHigh.Color;
end;

procedure TfrmPropriedades.pnlLowClick(Sender: TObject);
begin
  ColorDialoglow.Execute;
  pnlLow.Color := ColorDialoglow.Color;
end;

procedure TfrmPropriedades.pnlMidClick(Sender: TObject);
begin
  ColorDialogMid.Execute;
  pnlMid.Color := ColorDialogMid.Color;
end;

procedure TfrmPropriedades.btnDefinirClick(Sender: TObject);
begin
  with (frmBateria) do
  begin
    colorHigh    := pnlHigh.Color;;
    colorMid     := pnlMid.Color;
    colorLow     := pnlLow.Color;
    colorFundo   := pnlFundo.Color;
    tmr1.Enabled := True;
  end;

  //salvar em um txt no diretorio do .exe para quando abrir carregar as ultimas cores.
  Close;
end;

end.
