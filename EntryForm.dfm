object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Script Launcher'
  ClientHeight = 1053
  ClientWidth = 1041
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -22
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 192
  TextHeight = 27
  object GroupBox2: TGroupBox
    Left = 567
    Top = 17
    Width = 409
    Height = 1013
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'Sch Tools'
    TabOrder = 3
    object btnPasteArray: TButton
      Left = 20
      Top = 132
      Width = 228
      Height = 48
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Paste Array'
      TabOrder = 0
      OnClick = btnPasteArrayClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 17
    Top = 17
    Width = 527
    Height = 1013
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'PCB Tools'
    TabOrder = 2
    object btnPastePcbArray: TButton
      Left = 36
      Top = 156
      Width = 228
      Height = 48
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Paste Array'
      TabOrder = 0
      OnClick = btnPastePcbArrayClick
    end
  end
  object btnCurrentCalc: TButton
    Left = 50
    Top = 66
    Width = 232
    Height = 52
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'Current Calc'
    TabOrder = 0
    OnClick = btnCurrentCalcClick
  end
  object btnSCH_SelectFilter: TButton
    Left = 584
    Top = 66
    Width = 233
    Height = 52
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Caption = 'Select Touching Rect'
    TabOrder = 1
    OnClick = btnSCH_SelectFilterClick
  end
end
