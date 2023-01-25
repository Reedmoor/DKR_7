uses GraphABC, fractal;

var
  x0, y0, x00, y00, step, iter: integer;

function KU(i:integer):integer; forward;
function KD(i:integer):integer; forward;
function KR(i:integer):integer; forward;
function KL(i:integer):integer; forward;
function per: integer; forward;

function KU( i: integer): integer;
begin
  if i > 0 then
  begin
    KR(i - 1);
    LineUP(x0, y0, step);
    KU(i - 1);
    LineRIGHT(x0, y0, step);
    KU(i - 1);
    LineDOWN(x0, y0, step);
    KL(i - 1);
  end;
end;

function KD( i: integer): integer;
begin
  if i > 0 then
  begin
    KL(i - 1);
    LineDOWN(x0, y0, step);
    KD(i - 1);
    LineLEFT(x0, y0, step);
    KD(i - 1);
    LineUP(x0, y0, step);
    KR(i - 1);
  end;
end;

function KL( i: integer): integer;
begin
  if i > 0 then
  begin
    KD(i - 1);
    LineLEFT(x0, y0, step);
    KL(i - 1);
    LineDOWN(x0, y0, step);
    KL(i - 1);
    LineRIGHT(x0, y0, step);
    KU(i - 1);
  end;
end;

function KR( i: integer): integer;
begin
  if i > 0 then
  begin
    KU(i - 1);
    LineRIGHT(x0, y0, step);
    KR(i - 1);
    LineUP(x0, y0, step);
    KR(i - 1);
    LineLEFT(x0, y0, step);
    KD(i - 1);
  end;
end;

procedure control(key:integer);
begin
  case key of
    VK_Up : begin y00:=y00-10; per; end;
    VK_Down : begin y00:=y00+10; per; end;
    VK_Left : begin x00:=x00-10; per; end;
    VK_Right : begin x00:=x00+10; per; end;
    VK_q : begin step:=step+2; per; end;
    VK_w : begin if step > 0 then step:=step-2; per; end;
    VK_z : begin if iter<10 then iter:=iter+1; per; end;
    VK_x : begin if iter>0 then iter:=iter-1; per; end;
  end;
end;

function per: integer;
begin
  MaximizeWindow; 
  clearwindow;
  x0:=x00;
  y0:=y00;
  LockDrawing;
  KU(iter);
  redraw;
  onKeyDown:=control;
end;

begin
  iter:=1;
  x00:=20;
  y00:=1000;
  step:=100;
  per;
end.