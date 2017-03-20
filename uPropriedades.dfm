object frmPropriedades: TfrmPropriedades
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Bateria - Propriedades'
  ClientHeight = 219
  ClientWidth = 246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 17
  object btnDefinir: TSpeedButton
    Left = 144
    Top = 185
    Width = 89
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Definir'
    OnClick = btnDefinirClick
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 9
    Width = 224
    Height = 168
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Alterar cores do n'#237'vel da bateria: '
    TabOrder = 0
    object Label1: TLabel
      Left = 21
      Top = 30
      Width = 32
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Alta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 21
      Top = 64
      Width = 42
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Baixa:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 21
      Top = 98
      Width = 87
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'N'#237'vel Cr'#237'tico:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object Shape1: TShape
      Left = 113
      Top = 28
      Width = 24
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    object Shape2: TShape
      Left = 113
      Top = 62
      Width = 24
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    object Shape3: TShape
      Left = 113
      Top = 96
      Width = 24
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    object Label4: TLabel
      Left = 21
      Top = 132
      Width = 46
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Fundo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object Shape4: TShape
      Left = 113
      Top = 130
      Width = 24
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    object pnlMid: TPanel
      Left = 114
      Top = 63
      Width = 22
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      Color = 62194
      ParentBackground = False
      TabOrder = 0
      OnClick = pnlMidClick
    end
    object pnlLow: TPanel
      Left = 114
      Top = 97
      Width = 22
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      Color = clRed
      ParentBackground = False
      TabOrder = 1
      OnClick = pnlLowClick
    end
    object pnlFundo: TPanel
      Left = 114
      Top = 131
      Width = 22
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      OnClick = pnlFundoClick
    end
    object pnlHigh: TPanel
      Left = 114
      Top = 29
      Width = 22
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      Color = 3594496
      ParentBackground = False
      TabOrder = 3
      OnClick = pnlHighClick
    end
  end
  object ColorDialogHigh: TColorDialog
    Left = 8
    Top = 179
  end
  object ColorDialogMid: TColorDialog
    Left = 32
    Top = 179
  end
  object ColorDialoglow: TColorDialog
    Left = 56
    Top = 179
  end
  object ColorDialogFundo: TColorDialog
    Left = 85
    Top = 179
  end
end
