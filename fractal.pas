unit fractal;

interface
uses GraphABC;
procedure LineUP(var x0, y0, step: integer);
procedure LineDOWN(var x0, y0, step: integer);
procedure LineRIGHT(var x0, y0, step: integer);
procedure LineLEFT(var x0, y0, step: integer);

implementation

procedure LineUP(var x0, y0, step: integer);
begin
  line(x0, y0, x0, y0 - step);
  y0 := y0 - step;
end;

procedure LineDOWN(var x0, y0, step: integer);
begin
  Line(x0, y0, x0, y0 + step);
  y0 := y0 + step;
end;

procedure LineRIGHT(var x0, y0, step: integer);
begin
  Line(x0, y0, x0 + step, y0);
  x0 := x0 + step;
end;

procedure LineLEFT(var x0, y0, step: integer);
begin
  Line(x0, y0, x0 - step, y0);
  x0 := x0 - step;
end;
end.