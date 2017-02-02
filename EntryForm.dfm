object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Script Launcher'
  ClientHeight = 507
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 273
    Top = 8
    Width = 197
    Height = 488
    Caption = 'Sch Tools'
    TabOrder = 3
    object btnPasteArray: TButton
      Left = 8
      Top = 32
      Width = 112
      Height = 25
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Caption = 'Paste Array'
      TabOrder = 0
      OnClick = btnPasteArrayClick
    end
    object btnUpdateTemplate: TButton
      Left = 8
      Top = 65
      Width = 112
      Height = 25
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Caption = 'Update Templates'
      TabOrder = 1
      OnClick = btnUpdateTemplateClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 254
    Height = 488
    Caption = 'PCB Tools'
    TabOrder = 2
    object btnPastePcbArray: TButton
      Left = 16
      Top = 75
      Width = 110
      Height = 23
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Caption = 'Paste Array'
      TabOrder = 0
      OnClick = btnPastePcbArrayClick
    end
    object btnViaDirectConnect: TButton
      Left = 16
      Top = 112
      Width = 189
      Height = 32
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Caption = 'Add Via Connect Rule'
      TabOrder = 1
      OnClick = btnViaDirectConnectClick
    end
    object btnRepositionSelectedComponents: TButton
      Left = 16
      Top = 152
      Width = 216
      Height = 32
      Caption = 'Reposition Selected Components'
      TabOrder = 2
      OnClick = btnRepositionSelectedComponentsClick
    end
    object btnFixAssemText: TButton
      Left = 10
      Top = 440
      Width = 150
      Height = 32
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Caption = 'Fix Assembly Layer Text'
      TabOrder = 3
      OnClick = btnFixAssemTextClick
    end
  end
  object btnCurrentCalc: TButton
    Left = 24
    Top = 32
    Width = 112
    Height = 25
    Caption = 'Current Calc'
    TabOrder = 0
    OnClick = btnCurrentCalcClick
  end
  object btnSCH_SelectFilter: TButton
    Left = 281
    Top = 112
    Width = 112
    Height = 25
    Caption = 'Select Touching Rect'
    TabOrder = 1
    OnClick = btnSCH_SelectFilterClick
  end
end
