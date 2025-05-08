contract OnlyBool {
  a: Bool;
  b: Bool;
  c: Bool;
  d: Bool;
  e: Bool;
  f: Bool;
  g: Bool;
  h: Bool;
  i: Bool;
  j: Bool;

  init() {
    self.a=true; self.b=true; self.c=true; self.d=true; self.e=true;
    self.f=false; self.g=false; self.h=false; self.i=true; self.j=false;
  }
}