unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Calendar, ImgList, CategoryButtons,
  pngimage, ShellAPI, Comobj, MPlayer, JPEG, ValEdit, ComCtrls, CommCtrl,
  Gauges, Menus  ;

type
  TfrmBateria = class(TForm)
    Timer1: TTimer;
    ImageList1: TImageList;
    Gauge1: TGauge;
    TrayIcon: TTrayIcon;
    PopupMenu: TPopupMenu;
    MenuItem1: TMenuItem;
    Propriedades1: TMenuItem;
    N1: TMenuItem;
    imgBateria: TImage;
    imgDesconectada: TImage;
    tmr1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Propriedades1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure imgBateriaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
    MsgEstado, MsgBateria: String;
    SystemPowerStatus: TSystemPowerStatus;
    conectado: Boolean;


  public
    { Public declarations }
    colorHigh, colorMid, colorLow, colorFundo: TColor;
  end;

var
  frmBateria: TfrmBateria;

implementation

uses uPropriedades;


{$R *.dfm}

procedure TfrmBateria.FormCreate(Sender: TObject);
begin
  Self.Color                 := $00151100;
  Self.TransparentColor      := True;
  Self.TransparentColorValue := $00151100;

  colorHigh  := $0036D900;
  colorMid   := $0000F2F2;
  colorLow   := clRed;
  colorFundo := clWhite;

  conectado := True;
end;

procedure TfrmBateria.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfrmBateria.imgBateriaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfrmBateria.MenuItem1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmBateria.Propriedades1Click(Sender: TObject);
begin
  with (frmPropriedades) do
  begin
    pnlHigh.Color  := colorHigh;
    pnlMid.Color   := colorMid;
    pnlLow.Color   := colorLow;
    pnlFundo.Color := colorFundo;

    ShowModal;
  end;
end;

procedure TfrmBateria.Timer1Timer(Sender: TObject);
begin

  Gauge1.Visible   := True;
  Gauge1.BackColor := colorFundo;

  // obtém estado da bateria
  GetSystemPowerStatus(SystemPowerStatus);
  with SystemPowerStatus do
  begin
    // verifica estado de linha AC
    if(ACLineStatus = 0) then
    begin
      MsgEstado := 'Bateria Desconectada';
      imgBateria.SendToBack;

      imgBateria.Visible      := False;
      imgDesconectada.Visible := True;

      if(conectado) then
      begin
        TrayIcon.BalloonTitle := 'Nível de Bateria.';
        TrayIcon.BalloonHint  := 'Bateria desconectada';
        TrayIcon.ShowBalloonHint;

        conectado := False;
      end;
    end
    else if(ACLineStatus = 1) then
    begin
      MsgEstado := 'Bateria Conectada';
      imgBateria.BringToFront;

      imgBateria.Visible      := True;
      imgDesconectada.Visible := False;

      if not(conectado) then
      begin
        TrayIcon.BalloonTitle := 'Nível de Bateria.';
        TrayIcon.BalloonHint  := 'Bateria conectada';
        TrayIcon.ShowBalloonHint;

        conectado := True;
      end
    end
    else
      MsgEstado := 'Bateria Desconhecida';

    // verifica estado da bateria
    if (BatteryFlag = 255) then
      MsgBateria := 'Estado de bateria desconhecido'
    else if (BatteryFlag and 128) <> 0 then
      MsgBateria := 'Sistema sem bateria'
    else
    begin
      if (BatteryFlag and 1) <> 0 then
        MsgBateria := 'Bateria Alta'
      else if (BatteryFlag and 2) <> 0 then
        MsgBateria := 'Bateria Baixa'
      else if (BatteryFlag and 4) <> 0 then
        MsgBateria := 'Bateria em Nível Crítico';

      if (BatteryFlag and 8) <> 0 then
      begin
        MsgBateria := 'Carregando...';

        if (Gauge1.Progress = Gauge1.MaxValue) then
          Gauge1.Progress := 0
        else
          Gauge1.Progress := Gauge1.Progress + 20;

        Gauge1.MaxValue := BatteryLifePercent;
      end
      else
        Gauge1.Progress := BatteryLifePercent;

    end;
    // mostra percentual e tempo de vida da bateria
    if (BatteryLifePercent > 40) then
      Gauge1.ForeColor := colorHigh
    else if (BatteryLifePercent > 20) and (BatteryLifePercent <= 40) then
      Gauge1.ForeColor := colorMid
    else if (BatteryLifePercent <= 20) then
      Gauge1.ForeColor := colorLow;

    TrayIcon.Hint := MsgEstado + #13 + 'Atualmente com ' + IntToStr(SystemPowerStatus.BatteryLifePercent) + '% da capacidade(' + MsgBateria +')';
  end;
end;

procedure TfrmBateria.tmr1Timer(Sender: TObject);
begin
  SetWindowPos(Handle, HWND_TopMost, 0,0,0,0, SWP_NoMove + SWP_NoSize);
end;

end.
