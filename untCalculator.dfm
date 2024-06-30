object frmCalculator: TfrmCalculator
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  BorderWidth = 8
  Caption = 'Calculadora'
  ClientHeight = 346
  ClientWidth = 225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object lblResultado: TLabel
    Left = 0
    Top = 0
    Width = 225
    Height = 33
    Align = alTop
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'lblResultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 8
    ExplicitTop = 16
  end
  object btnZero: TButton
    Left = 56
    Top = 296
    Width = 57
    Height = 49
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = False
    OnClick = btnNumeroClick
  end
  object btnUm: TButton
    Left = 0
    Top = 248
    Width = 57
    Height = 49
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = False
    OnClick = btnNumeroClick
  end
  object btnDois: TButton
    Left = 56
    Top = 248
    Width = 57
    Height = 49
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = False
    OnClick = btnNumeroClick
  end
  object btnTres: TButton
    Left = 112
    Top = 248
    Width = 57
    Height = 49
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TabStop = False
    OnClick = btnNumeroClick
  end
  object btnQuatro: TButton
    Left = 0
    Top = 200
    Width = 57
    Height = 49
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TabStop = False
    OnClick = btnNumeroClick
  end
  object btnCinco: TButton
    Left = 56
    Top = 200
    Width = 57
    Height = 49
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TabStop = False
    OnClick = btnNumeroClick
  end
  object btnSeis: TButton
    Left = 112
    Top = 200
    Width = 57
    Height = 49
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TabStop = False
    OnClick = btnNumeroClick
  end
  object btnOito: TButton
    Left = 56
    Top = 152
    Width = 57
    Height = 49
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    TabStop = False
    OnClick = btnNumeroClick
  end
  object btnSete: TButton
    Left = 0
    Top = 152
    Width = 57
    Height = 49
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    TabStop = False
    OnClick = btnNumeroClick
  end
  object btnNove: TButton
    Left = 112
    Top = 152
    Width = 57
    Height = 49
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    TabStop = False
    OnClick = btnNumeroClick
  end
  object btnDecimal: TButton
    Left = 112
    Top = 296
    Width = 57
    Height = 49
    Caption = ','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    TabStop = False
    OnClick = btnDecimalClick
  end
  object btnPercentual: TButton
    Left = 0
    Top = 56
    Width = 57
    Height = 49
    Caption = '%'
    TabOrder = 11
    TabStop = False
    OnClick = btnOperacaoClick
  end
  object btnInverso: TButton
    Left = 0
    Top = 104
    Width = 57
    Height = 49
    Caption = #8543'x'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Calligraphy'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    TabStop = False
    OnClick = btnOperacaoClick
  end
  object btnPotencia: TButton
    Left = 56
    Top = 104
    Width = 57
    Height = 49
    Caption = 'x'#178
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Calligraphy'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    TabStop = False
    OnClick = btnOperacaoClick
  end
  object btnRaizQuadrada: TButton
    Left = 112
    Top = 104
    Width = 57
    Height = 49
    Caption = #178#8730'x'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Calligraphy'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    TabStop = False
    OnClick = btnOperacaoClick
  end
  object btnLimpar: TButton
    Left = 112
    Top = 56
    Width = 57
    Height = 49
    Caption = 'C'
    TabOrder = 15
    TabStop = False
    OnClick = btnLimparClick
  end
  object btnDividir: TButton
    Left = 168
    Top = 104
    Width = 57
    Height = 49
    Caption = #247
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    TabStop = False
    OnClick = btnOperacaoClick
  end
  object btnMultiplicar: TButton
    Left = 168
    Top = 152
    Width = 57
    Height = 49
    Caption = #180
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Symbol'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    TabStop = False
    OnClick = btnOperacaoClick
  end
  object btnSubtrair: TButton
    Left = 168
    Top = 200
    Width = 57
    Height = 49
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Symbol'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    TabStop = False
    OnClick = btnOperacaoClick
  end
  object btnAdicionar: TButton
    Left = 168
    Top = 248
    Width = 57
    Height = 49
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Symbol'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    TabStop = False
    OnClick = btnOperacaoClick
  end
  object btnIgual: TButton
    Left = 168
    Top = 296
    Width = 57
    Height = 49
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Symbol'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
    TabStop = False
    OnClick = btnIgualClick
  end
  object btnApagarUltimoDigito: TButton
    Left = 168
    Top = 56
    Width = 57
    Height = 49
    Caption = #213
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    TabStop = False
    OnClick = btnApagarUltimoDigitoClick
  end
  object btnLimparEntrada: TButton
    Left = 56
    Top = 56
    Width = 57
    Height = 49
    Caption = 'CE'
    TabOrder = 22
    TabStop = False
    OnClick = btnLimparEntradaClick
  end
  object btnInverterSinal: TButton
    Left = 0
    Top = 296
    Width = 57
    Height = 49
    Caption = '+/-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 23
    TabStop = False
    OnClick = btnInverterSinalClick
  end
end
