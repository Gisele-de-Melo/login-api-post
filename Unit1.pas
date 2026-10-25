unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Net.HttpClient,
  System.Net.URLClient,
  System.JSON;


type
  TForm1 = class(TForm)
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnLogin: TButton;
    mmRetorno: TMemo;
    mmJSON: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnLoginClick(Sender: TObject);
var
  Http: THTTPClient;
  Response: IHTTPResponse;
  JSONBody: TJSONObject;
  JSONRetorno: TJSONObject;
  Stream: TStringStream;
begin
  Http := THTTPClient.Create;
  JSONBody := TJSONObject.Create;
  try
    JSONBody.AddPair('username', edtUsuario.Text);
    JSONBody.AddPair('password', edtSenha.Text);
    JSONBody.AddPair('expiresInMins', TJSONNumber.Create(30));
    Stream := TStringStream.Create(JSONBody.ToJSON, TEncoding.UTF8);
    try
      Stream.Position := 0;
      Http.ContentType := 'application/json';
      Response := Http.Post(
        'https://dummyjson.com/user/login',
        Stream
      );
      mmJSON.Lines.Text := Response.ContentAsString;
      if Response.StatusCode = 200 then
      begin
        JSONRetorno := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONObject;
        try
          mmRetorno.Clear;
          mmRetorno.Lines.Add('Login realizado com sucesso!');
          mmRetorno.Lines.Add('');
          mmRetorno.Lines.Add('Nome: ' +
            JSONRetorno.GetValue<string>('firstName'));
          mmRetorno.Lines.Add('Sobrenome: ' +
            JSONRetorno.GetValue<string>('lastName'));
          mmRetorno.Lines.Add('E-mail: ' +
            JSONRetorno.GetValue<string>('email'));
          mmRetorno.Lines.Add('');
          mmRetorno.Lines.Add('Access Token:');
          mmRetorno.Lines.Add(
            JSONRetorno.GetValue<string>('accessToken')
          );
        finally
          JSONRetorno.Free;
        end;
      end
      else
        ShowMessage('Erro: ' + Response.StatusCode.ToString);
    finally
      Stream.Free;
    end;
  finally
    JSONBody.Free;
    Http.Free;
  end;
end;

end.
