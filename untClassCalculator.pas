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
unit untClassCalculator;

interface

uses System.Classes, System.SysUtils, System.Math;

type
  TCalculator = class
  private
    FCurrentValue: Double;
    FCurrentValueStr: String;
    FStoredValue: Double;
    FCurrentOperation: string;
    FDecimalEntered: Boolean;
    FEqualEntered: Boolean;
    FAccumulated: Boolean;
    procedure SetCurrentValue(const Value: Double);
    procedure SetCurrentValueStr(const Value: String);
    function DecimalPlaces(Number: String): String;
    function FormatNumberToFloat(Number:String):String;
  public
    constructor Create;
    procedure Clear;
    procedure AddDigit(Digit: string);
    procedure Calculate;
    procedure CalculateAddition;
    procedure CalculateSubtraction;
    procedure CalculateMultiplication;
    procedure CalculateDivision;
    procedure CalculatePercent;
    procedure CalculateSquareRoot;
    procedure CalculateInverse;
    procedure CalculatePower;
    procedure AddDecimal;
    procedure DeleteLastDigit;
    procedure InvertSign;
    procedure CancelEntry;
    procedure SetCurrentOperation(const Value: String);
    property CurrentValue: Double read FCurrentValue write SetCurrentValue;
    property CurrentValueStr : String read FCurrentValueStr write SetCurrentValueStr;
    property CurrentOperation : String read FCurrentOperation write SetCurrentOperation;
  end;

implementation

{ TCalculator }

constructor TCalculator.Create;
begin
  Clear;
end;

procedure TCalculator.AddDecimal;
begin
  if not FDecimalEntered then
    begin
      FDecimalEntered := True;
      if Pos(',', FCurrentValueStr) = 0 then
        FCurrentValueStr := FCurrentValueStr + ',';
    end;
end;

procedure TCalculator.AddDigit(Digit: string);
var
  valueStr : String;
begin
  if FEqualEntered and (FCurrentOperation = '') then
    Clear;

  if ((FCurrentValue = 0) or FAccumulated) and (not FDecimalEntered) then
    begin
      FCurrentValue := StrToFloat(Digit);
      FCurrentValueStr := Digit;
      FAccumulated := False;
    end
  else
    begin
      valueStr := FCurrentValueStr + Digit;
      FCurrentValueStr := FormatNumberToFloat(valueStr);
      FCurrentValue    := StrToFloat(StringReplace(FCurrentValueStr,'.','',[rfReplaceAll])); //Remove os pontos, deixando somente número com casas decimais
    end;
end;

procedure TCalculator.Calculate;
begin
  if FCurrentOperation = '+' then
    FCurrentValue := FStoredValue + FCurrentValue
  else
  if FCurrentOperation = '-' then
    FCurrentValue := FStoredValue - FCurrentValue
  else
  if FCurrentOperation = '*' then
    FCurrentValue := FStoredValue * FCurrentValue
  else
  if FCurrentOperation = '^' then
    FCurrentValue := Power(FStoredValue, 2)
  else
  if FCurrentOperation = '2' then
    FCurrentValue := Sqrt(FStoredValue)
  else
  if FCurrentOperation = '%' then
    FCurrentValue :=  FStoredValue + ((FStoredValue * FCurrentValue) / 100)
  else
  if FCurrentOperation = '/' then
    begin
      if FCurrentValue > 0 then
        FCurrentValue := FStoredValue / FCurrentValue
      else
        raise Exception.Create('Divisão por zero não permitida');
    end
  else
  if FCurrentOperation = 'i' then
    begin
      if FStoredValue > 0 then
        FCurrentValue := 1 / FStoredValue
      else
        raise Exception.Create('Divisão por zero não permitida');
    end;

  FCurrentValueStr := FormatNumberToFloat(FloatToStr(FCurrentValue));

  FCurrentOperation := '';
  FEqualEntered := True;
end;

procedure TCalculator.CalculateDivision;
begin
  SetCurrentOperation('/');
end;

procedure TCalculator.CalculateAddition;
begin
  SetCurrentOperation('+');
end;

procedure TCalculator.CalculateInverse;
begin
  SetCurrentOperation('i');
end;

procedure TCalculator.CalculateMultiplication;
begin
  SetCurrentOperation('*');
end;

procedure TCalculator.CalculatePercent;
begin
  FCurrentOperation := '%';

  if FStoredValue = 0 then
  begin
    Calculate;
    FCurrentOperation := '';
  end;
end;

procedure TCalculator.CalculatePower;
begin
  SetCurrentOperation('^');
end;

procedure TCalculator.CalculateSquareRoot;
begin
  SetCurrentOperation('2');
end;

procedure TCalculator.CalculateSubtraction;
begin
  SetCurrentOperation('-');
end;

procedure TCalculator.CancelEntry;
begin
  FCurrentValue := 0;
  FCurrentValueStr := '0';
  FDecimalEntered := False;
  FEqualEntered := False;
end;

procedure TCalculator.Clear;
begin
  FCurrentValue := 0;
  FCurrentValueStr := '0';
  FStoredValue := 0;
  FCurrentOperation := '';
  FDecimalEntered := False;
  FEqualEntered := False;
  FAccumulated := False;
end;

procedure TCalculator.DeleteLastDigit;
begin
  if FEqualEntered then
    Exit;

  if Length(FCurrentValueStr) > 0 then
    begin
      CurrentValueStr := Copy(FCurrentValueStr, 1, Length(FCurrentValueStr) - 1);
      if CurrentValueStr = '' then
        begin
          FCurrentValue := 0;
          FCurrentValueStr := '0';
        end
      else
        FCurrentValue := StrToFloat(StringReplace(FCurrentValueStr,'.','',[rfReplaceAll]));

       CurrentValueStr := FormatNumberToFloat(FCurrentValueStr);
    end;
end;

function TCalculator.FormatNumberToFloat(Number: String): String;
var
  doubleNumber : Double;

begin
  doubleNumber := StrToFloat(StringReplace(Number,'.','',[rfReplaceAll]));
  Result := FormatFloat('#,##0.'+DecimalPlaces(Number),doubleNumber);
end;

procedure TCalculator.InvertSign;
begin
  FCurrentValue := -FCurrentValue;
  FCurrentValueStr := FormatNumberToFloat(FloatToStr(FCurrentValue));
end;

procedure TCalculator.SetCurrentOperation(const Value: String);
begin

  if (not FEqualEntered) and (FStoredValue <> 0) and (FCurrentValue <> 0) then
    begin
      Calculate;
      FStoredValue  := FCurrentValue;
      FEqualEntered := False;
      FAccumulated  := True;
    end
  else
    begin
      FStoredValue     := FCurrentValue;
      FAccumulated     := False;
      FCurrentValue    := 0;
      FCurrentValueStr := '0';
    end;

  FCurrentOperation := Value;
end;

procedure TCalculator.SetCurrentValue(const Value: Double);
begin
  FCurrentValue := Value;
end;

procedure TCalculator.SetCurrentValueStr(const Value: String);
begin
  FCurrentValueStr := Value;
end;

function TCalculator.DecimalPlaces(Number: String): String;
var
  NumberStr: string;
  DecimalPos: Integer;
  count: Integer;
  i: Integer;
  firsDecimal : String;
begin
  //inicializa a variável com vazio;
  firsDecimal := '';

  //remove o ponto do número
  NumberStr := StringReplace(Number,'.','',[rfReplaceAll]);

  // Encontra a posição do ponto decimal
  DecimalPos := Pos(FormatSettings.DecimalSeparator, NumberStr);

  // Se houver ponto decimal, conta os dígitos após ele
  // e encontra o primeiro digito decimal
  if DecimalPos > 0 then
  begin
    count := Length(NumberStr) - DecimalPos;
    firsDecimal := Copy(NumberStr, DecimalPos+1, 1);
  end
  else
    count := 0;

  //se não houver casas decimais, seta para 2
  if count = 0 then
    count := 2;

  //se as casas decimais forem maior que 16, limita a 16
  if count > 16 then
    count := 16;

  //retorna o carater # que servirá de máscara
  //para formatar o número, de acordo com as casas decimais
  for I := 1 to count do
  begin
    if firsDecimal = '0' then
      Result := Result + '0'
    else
      Result := Result + '#';
  end;
end;

end.
