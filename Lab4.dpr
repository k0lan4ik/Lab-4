program Lab4;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type
  TIntegral = function(X: Real): Real;

function RectangleMethod(Func: TIntegral; A, B, E: Real; var N: integer): Real;
var
  H, X, Prev: Real;
  I: integer;
begin
  Result := Func((B - A) / 2);
  N := 0;
  repeat
    N := N + 5;
    H := (B - A) / N;
    Prev := Result;
    Result := 0;
    for I := 0 to (N - 1) do
    begin
      X := A + I * H + (H / 2);
      Result := Result + Func(X);
    end;
  until Abs(Result - Prev) > E;
end;

function MetodTrap(Integral: TIntegral; a, b:Real; eps: Real; var N: Integer): Real;
var h: Real;
    prevI, xi: Real;
    i: Integer;
begin
  N := 0;

  repeat
    Inc(N,5);
    h := (b-a) / N;
    prevI := (b - a) * Integral(a);
    xi := a + h;
    Result := 0;
    for i := 1 to N-1 do
    begin
      Result := Result + Integral(xi);
      xi := xi + h;
    end;
    Result := Result + (Integral(a) + Integral(xi)) / 2;
    Result := Result * h;

  until Abs(Result - prevI) <= eps;

end;

begin

end.
