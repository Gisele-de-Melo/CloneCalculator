//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit untCalculator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, untClassCalculator;

type
  TfrmCalculator = class(TForm)
    lblResultado: TLabel;
    btnZero: TButton;
    btnUm: TButton;
    btnDois: TButton;
    btnTres: TButton;
    btnQuatro: TButton;
    btnCinco: TButton;
    btnSeis: TButton;
    btnOito: TButton;
    btnSete: TButton;
    btnNove: TButton;
    btnDecimal: TButton;
    btnPercentual: TButton;
    btnInverso: TButton;
    btnPotencia: TButton;
    btnRaizQuadrada: TButton;
    btnLimpar: TButton;
    btnDividir: TButton;
    btnMultiplicar: TButton;
    btnSubtrair: TButton;
    btnAdicionar: TButton;
    btnIgual: TButton;
    btnApagarUltimoDigito: TButton;
    btnLimparEntrada: TButton;
    btnInverterSinal: TButton;
    procedure btnLimparEntradaClick(Sender: TObject);
    procedure btnInverterSinalClick(Sender: TObject);
    procedure btnApagarUltimoDigitoClick(Sender: TObject);
    procedure btnDecimalClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure btnNumeroClick(Sender: TObject);
    procedure btnOperacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FUltimoDigitado : String;
    Calculator : TCalculator;
    procedure AtualizaResultado(const Key: String = '');
  public
    { Public declarations }
  end;

var
  frmCalculator: TfrmCalculator;

implementation

{$R *.dfm}

procedure TfrmCalculator.AtualizaResultado(const Key: String = '');
begin
  if Key <> '' then
    begin

      if Calculator.CurrentValueStr <> '0' then
        lblResultado.Caption := Calculator.CurrentValueStr + ' ' + Key
      else
        lblResultado.Caption := FUltimoDigitado + ' ' + Key;

    end
  else
    lblResultado.Caption := Calculator.CurrentValueStr;
end;

procedure TfrmCalculator.btnApagarUltimoDigitoClick(Sender: TObject);
begin
  Calculator.DeleteLastDigit;
  ActiveControl := nil;
  AtualizaResultado;
end;

procedure TfrmCalculator.btnDecimalClick(Sender: TObject);
begin
  Calculator.AddDecimal;
  AtualizaResultado;
end;

procedure TfrmCalculator.btnIgualClick(Sender: TObject);
begin
  try
    Calculator.Calculate;
    AtualizaResultado;
  except
    on E: Exception do
      Application.MessageBox(PWideChar(E.Message), 'Erro', MB_OK+MB_ICONERROR);
  end;
end;

procedure TfrmCalculator.btnLimparClick(Sender: TObject);
begin
  Calculator.Clear;
  ActiveControl := nil;
  AtualizaResultado;
end;

procedure TfrmCalculator.btnLimparEntradaClick(Sender: TObject);
begin
  Calculator.CancelEntry;
  lblResultado.Caption := '0';
  ActiveControl := nil;
end;

procedure TfrmCalculator.btnNumeroClick(Sender: TObject);
begin
  Calculator.AddDigit((Sender as TButton).Caption);
  ActiveControl := nil;

  if Calculator.CurrentValueStr <> '0' then
    FUltimoDigitado := Calculator.CurrentValueStr
  else
    FUltimoDigitado := (Sender as TButton).Caption;

  AtualizaResultado;
end;

procedure TfrmCalculator.btnOperacaoClick(Sender: TObject);
begin
  try
    if (Sender as TButton).Name = 'btnMultiplicar' then
      Calculator.CalculateMultiplication
    else
    if (Sender as TButton).Name = 'btnDividir' then
      Calculator.CalculateDivision
    else
    if (Sender as TButton).Name = 'btnAdicionar' then
      Calculator.CalculateAddition
    else
    if (Sender as TButton).Name = 'btnSubtrair' then
      Calculator.CalculateSubtraction
    else
    if (Sender as TButton).Name = 'btnInverso' then
      begin
        Calculator.CalculateInverse;
        Calculator.Calculate;
      end
    else
    if (Sender as TButton).Name = 'btnPotencia' then
      begin
        Calculator.CalculatePower;
        Calculator.Calculate;
      end
    else
    if (Sender as TButton).Name = 'btnRaizQuadrada' then
      begin
        Calculator.CalculateSquareRoot;
        Calculator.Calculate;
      end
    else
    if (Sender as TButton).Name = 'btnInverterSinal' then
      Calculator.InvertSign
    else
    if (Sender as TButton).Name = 'btnPercentual' then
      Calculator.CalculatePercent;

    ActiveControl := nil;
    AtualizaResultado(Calculator.CurrentOperation);

  except
    on E: Exception do
     Application.MessageBox(PWideChar(E.Message), 'Erro', MB_OK + MB_ICONERROR);
  end;

end;

procedure TfrmCalculator.btnInverterSinalClick(Sender: TObject);
begin
  Calculator.InvertSign;
  ActiveControl := nil;
  AtualizaResultado;
end;

procedure TfrmCalculator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Calculator) then
    Calculator.Free;
end;

procedure TfrmCalculator.FormCreate(Sender: TObject);
begin
  Calculator := TCalculator.Create;
  KeyPreview := True;
  AtualizaResultado;
end;

procedure TfrmCalculator.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9':
      begin
        Calculator.AddDigit(Key);

        if Calculator.CurrentValueStr <> '0' then
          FUltimoDigitado := Calculator.CurrentValueStr
        else
          FUltimoDigitado := Key;

        AtualizaResultado;
      end;
    '+', '-', '*', '/':
      begin
        Calculator.SetCurrentOperation(Key);
        AtualizaResultado(Key);
      end;
    '=':
      begin
        try
          Calculator.Calculate;
          AtualizaResultado;
        except
          on E: Exception do
            Application.MessageBox(PWideChar(E.Message), 'Erro', MB_OK+MB_ICONERROR);
        end;
      end;
    #8: // Backspace
      begin
        Calculator.DeleteLastDigit;
        AtualizaResultado;
      end;
    '.', ',':
      begin
        Calculator.AddDecimal;
        AtualizaResultado;
      end;
    #$1B: //Esc
      begin
         Calculator.Clear;
         AtualizaResultado;
      end;
    #13: // Enter
      begin
        try
          Calculator.Calculate;
          AtualizaResultado;
        except
          on E: Exception do
            Application.MessageBox(PWideChar(E.Message), 'Erro', MB_OK + MB_ICONERROR);
        end;
      end;
  end;
end;

end.
