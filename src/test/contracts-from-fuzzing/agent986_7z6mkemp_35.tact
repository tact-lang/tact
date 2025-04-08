contract ManyBoolIntOpts {
  a: Bool;
  b: Bool?;
  c: Bool;
  d: Bool?;
  e: Int;
  f: Int?;
  g: Int;
  h: Int?;

  init() {
    self.a=true; self.b=null; self.c=false; self.d=null;
    self.e=1; self.f=null; self.g=2; self.h=null;
  }
}