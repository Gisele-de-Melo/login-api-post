object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Login API POST'
  ClientHeight = 555
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblUsuario: TLabel
    Left = 8
    Top = 8
    Width = 40
    Height = 15
    Caption = 'Usu'#225'rio'
  end
  object lblSenha: TLabel
    Left = 199
    Top = 8
    Width = 32
    Height = 15
    Caption = 'Senha'
  end
  object Label1: TLabel
    Left = 8
    Top = 57
    Width = 119
    Height = 15
    Caption = 'Retorno Desserializado'
  end
  object Label2: TLabel
    Left = 8
    Top = 291
    Width = 93
    Height = 15
    Caption = 'Retorno em JSON'
  end
  object edtUsuario: TEdit
    Left = 8
    Top = 24
    Width = 185
    Height = 23
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 199
    Top = 24
    Width = 185
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnLogin: TButton
    Left = 390
    Top = 22
    Width = 89
    Height = 28
    Caption = 'Login'
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object mmRetorno: TMemo
    Left = 8
    Top = 78
    Width = 471
    Height = 203
    TabOrder = 3
  end
  object mmJSON: TMemo
    Left = 8
    Top = 312
    Width = 471
    Height = 233
    TabOrder = 4
  end
end
