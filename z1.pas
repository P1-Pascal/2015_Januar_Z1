program z1(input, output);

const
  MAX_LEN=50;
  MAX_N=10;
  MIN_N=5;

type
  matrix = array[1..MAX_N, 1..MAX_N] of char;
  key = array[1..MAX_N] of integer;

var
  m: matrix;
  k: key;
  n, len: integer;

function loadKey(var k: key; var n: integer): boolean;
var
  x: integer;
begin
  n:=0;
  while (not eoln(input)) and (n<=MAX_N) do
  begin
    n:=n+1;
    read(input, x);
    k[x]:=n;
  end;
  if eoln(input) then
    readln(input);
  loadKey:=(n>=MIN_N) and (n<=MAX_N);
end;

function loadMatrix(var m: matrix; n: integer; var len: integer): boolean;
var
  i, j: integer;
  b: boolean;
begin
  b:=true;
  len:=0;
  for i:=1 to n do
    for j:= 1 to n do
      begin
        if (((i-1)*n+j) > MAX_LEN) then
          b:=false;

        if b and (not eoln(input)) then
          begin
            read(m[i][j]);
            len:=len+1;
          end;
      end;

  if (eoln(input)) then
    readln(input);

  loadMatrix:=b;
end;

procedure readColumn(var m: matrix; n, col, len: integer);
var
  i: integer;
begin
  i:=1;
  while ((i-1)*n+col) <= len do
  begin
    write(output, m[i][col]);
    i:=i+1;
  end;
end;

procedure encript(var m: matrix; var k: key; n, len: integer);
var
  i: integer;
begin
  for i:=1 to n do
    readColumn(m, n, k[i], len);
  writeln();
end;


begin

  if loadKey(k, n) then
    if loadMatrix(m, n, len) then
      encript(m, k, n, len);

  //readln();

end.

