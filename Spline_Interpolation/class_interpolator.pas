unit class_interpolator;

interface

uses SysUtils, Math,
     class_node, unit_sle;

var
    // Tells if full interpolation is done
    Done : boolean;

    // Size of array
    N : integer;

    // Array of M coefficients
    M : array of extended;

    // Array of NODES
    Nodes : array of TNode;

type
  TInterpolator = class
  public

    // Returns spline function value of X
    class function Spline(x:extended):extended; overload;

    // Returns spline function value of X on I-cut
    class function Spline(i:integer; x:extended):extended; overload;

    // Calculates all splines for NODES
    class procedure Interpolate(na:array of TNode);

    // Tells if interpolation is ready
    class function IsDone : boolean;

  private

    // Sorts NODES
    class procedure SortNodes();

    // Returns X[i] - X[i-1] STEP
    class function h(i:integer):extended;

    // Returns X[i]
    class function xi(i:integer):extended;

    // Returns F(X[i])
    class function f(i:integer):extended;

  end;

implementation

class function TInterpolator.Spline(x:extended):extended;
var i:integer;
begin
  i:=0;
  while not ((x >= xi(i)) and (x <= xi(i+1))) do
    if (i+1)<Length(Nodes) then
      inc(i)
    else
      Break;
  Result :=  Spline(i, x);
end;

//Hermite Spline function
class function TInterpolator.Spline(i:integer; x:extended):extended;
begin
  Result := ( M[i+1]*Power(x - xi(i), 3) + M[i]*Power(xi(i+1) - x, 3))/(3*h(i)) + (f(i+1)/h(i) - M[i+1]*h(i)/3)*(x-xi(i)) + (f(i)/h(i) - M[i]*h(i)/3)*(xi(i+1)-x);
end;

//Interpolation itself
class procedure TInterpolator.Interpolate(na:array of TNode);
var i, j:integer;
    A:TMatrix;
    B:array of extended;
begin
  Done:=false;

  //Check number of nodes
  N := Length(na) - 1;
  if N<=2 then
    begin
      Raise Exception.Create('Number of nodes must be greater than 3!') at @TInterpolator.Interpolate;
      Exit;
    end;

  SetLength(Nodes, N+1);
  for i:=0 to N do
    Nodes[i] := na[i];

  SortNodes();

  //Form a tridiagonal matrix
  SetLength(A, N+1);
  for i:=0 to N do
    begin
      SetLength(A[i], N+1);
      for j:=0 to N do
        A[i, j]:=0;
    end;
  A[0, 0] := 1;
  A[N, N] := 1;

  SetLength(B, N+1);
  SetLength(M, N+1);
  M[0]:=0;
  M[N]:=0;
  for i:=1 to N-1 do
    begin
      A[i, i-1]:=h(i-1);
      A[i, i] := 2*(h(i-1) + h(i));
      A[i, i+1] := h(i);
      B[i]:=3*( (f(i+1)-f(i))/h(i) - (f(i)-f(i-1))/h(i-1));
    end;

  //Find M coefficients
  TSLESolver.TridiagonalShuttle(A, B, M);

  Done:=true;
end;

class function TInterpolator.IsDone:boolean;
begin
  Result:=Done;
end;

class procedure TInterpolator.SortNodes();
var i, j, l:integer;
    t : TNode;
begin
  for i:=0 to N-1 do
    begin
      l := i;
      t := Nodes[i];
      for j:=i+1 to N do
        if Nodes[j].X<t.X then
          begin
            l := j;
            t := Nodes[j];
          end;
      Nodes[l] := Nodes[i];
      Nodes[i] := t;
    end;
end;

class function TInterpolator.h(i:integer):extended;
begin
  if i<Length(Nodes)-1 then
    Result :=  Nodes[i+1].X - Nodes[i].X
  else
    Result := 0;
end;

class function TInterpolator.xi(i:integer):extended;
begin
  if i<Length(Nodes) then
    Result := Nodes[i].X
  else
    Result := 0;
end;

class function TInterpolator.f(i:integer):extended;
begin
  if i<Length(Nodes) then
    Result :=  Nodes[i].Y
  else
    Result := 0;
end;

end.
