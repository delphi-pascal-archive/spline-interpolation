object Form1: TForm1
  Left = 223
  Top = 124
  Width = 858
  Height = 583
  Caption = 'Spline Interpolator'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnResize = FormResize
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 178
    Width = 850
    Height = 4
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    MinSize = 140
    ResizeStyle = rsUpdate
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 178
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 721
      Height = 178
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object NodeView: TValueListEditor
        Left = 0
        Top = 0
        Width = 721
        Height = 178
        Align = alClient
        DisplayOptions = [doColumnTitles, doKeyColFixed]
        KeyOptions = [keyEdit, keyAdd, keyDelete, keyUnique]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking]
        ScrollBars = ssVertical
        Strings.Strings = (
          '0=0')
        TabOrder = 0
        TitleCaptions.Strings = (
          'Xi'
          'F (Xi)')
        OnValidate = NodeViewValidate
        ColWidths = (
          150
          540)
      end
    end
    object Panel4: TPanel
      Left = 721
      Top = 0
      Width = 129
      Height = 178
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Button2: TButton
        Left = 10
        Top = 49
        Width = 31
        Height = 31
        Caption = '-'
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 10
        Top = 128
        Width = 111
        Height = 31
        Caption = 'Interpolate'
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button1: TButton
        Left = 10
        Top = 11
        Width = 31
        Height = 31
        Caption = '+'
        TabOrder = 2
      end
      object CheckBox1: TCheckBox
        Left = 48
        Top = 44
        Width = 119
        Height = 21
        Caption = 'Nodes'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CheckBox3Click
      end
      object CheckBox2: TCheckBox
        Left = 48
        Top = 73
        Width = 119
        Height = 21
        Caption = 'Lines'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = CheckBox3Click
      end
      object CheckBox3: TCheckBox
        Left = 48
        Top = 16
        Width = 119
        Height = 21
        Caption = 'Values'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = CheckBox3Click
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 182
    Width = 850
    Height = 349
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object PaintBox1: TPaintBox
      Left = 0
      Top = 0
      Width = 850
      Height = 349
      Align = alClient
      Constraints.MinHeight = 21
      Constraints.MinWidth = 11
      OnPaint = PaintBox1Paint
    end
  end
  object MainMenu1: TMainMenu
    Left = 800
    Top = 40
    object File1: TMenuItem
      Caption = 'File'
      object Save1: TMenuItem
        Caption = 'Save'
        OnClick = Save1Click
      end
      object Load1: TMenuItem
        Caption = 'Load'
        OnClick = Load1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 784
  end
end
