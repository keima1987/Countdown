object frmCountdown: TfrmCountdown
  Left = 315
  Top = 216
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Countdown/Counter'
  ClientHeight = 155
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblDate: TLabel
    Left = 8
    Top = 0
    Width = 24
    Height = 13
    Caption = '&Date'
    FocusControl = bdDate
  end
  object lblCountdown: TLabel
    Left = 8
    Top = 48
    Width = 321
    Height = 44
    Alignment = taRightJustify
    AutoSize = False
    Caption = '-.--:--:--.---'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -44
    Font.Name = 'Digital-7'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblTime: TLabel
    Left = 96
    Top = 0
    Width = 23
    Height = 13
    Caption = '&Time'
    FocusControl = bdTime
  end
  object lblHours: TLabel
    Left = 184
    Top = 0
    Width = 31
    Height = 13
    Caption = '&Hours'
    FocusControl = speHours
  end
  object lblMin: TLabel
    Left = 232
    Top = 0
    Width = 20
    Height = 13
    Caption = '&Min'
    FocusControl = speMin
  end
  object lblSec: TLabel
    Left = 280
    Top = 0
    Width = 17
    Height = 13
    Caption = 'Se&c'
    FocusControl = speSec
  end
  object bdDate: TDateTimePicker
    Left = 8
    Top = 16
    Width = 81
    Height = 21
    Date = 41971.000000000000000000
    Time = 41971.000000000000000000
    DateMode = dmUpDown
    TabOrder = 0
  end
  object bdTime: TDateTimePicker
    Left = 96
    Top = 16
    Width = 81
    Height = 21
    Date = 41971.000000000000000000
    Time = 41971.000000000000000000
    DateMode = dmUpDown
    Kind = dtkTime
    TabOrder = 1
  end
  object btnStartStop: TButton
    Left = 8
    Top = 96
    Width = 321
    Height = 25
    Caption = '&Start'
    TabOrder = 2
    OnClick = btnStartStopClick
  end
  object rgMode: TRadioGroup
    Left = 336
    Top = 8
    Width = 137
    Height = 145
    Caption = 'M&ode'
    ItemIndex = 0
    Items.Strings = (
      'Countdown (Date)'
      'Countdown (Timer)'
      'Counter')
    TabOrder = 3
    OnClick = cbCounterClick
  end
  object speHours: TSpinEdit
    Left = 184
    Top = 16
    Width = 41
    Height = 22
    EditorEnabled = False
    Enabled = False
    MaxValue = 23
    MinValue = 0
    TabOrder = 4
    Value = 0
  end
  object speMin: TSpinEdit
    Left = 232
    Top = 16
    Width = 41
    Height = 22
    EditorEnabled = False
    Enabled = False
    MaxValue = 59
    MinValue = 0
    TabOrder = 5
    Value = 0
  end
  object speSec: TSpinEdit
    Left = 280
    Top = 16
    Width = 41
    Height = 22
    EditorEnabled = False
    Enabled = False
    MaxValue = 59
    MinValue = 0
    TabOrder = 6
    Value = 0
  end
  object btnReset: TButton
    Left = 8
    Top = 128
    Width = 321
    Height = 25
    Caption = '&Reset'
    TabOrder = 7
    OnClick = btnResetClick
  end
  object tmCountdown: TTimer
    Enabled = False
    Interval = 10
    OnTimer = tmCountdownTimer
    Left = 400
    Top = 96
  end
  object XPManifest1: TXPManifest
    Left = 432
    Top = 96
  end
end
