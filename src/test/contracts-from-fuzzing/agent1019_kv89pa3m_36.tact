contract WeirdMixed {
  a: Int as uint64;
  b: Bool;
  c: String?;
  d: Int;
  e: Bool?;
  f: String;

  init() {
    self.a=42; self.b=true; self.c=null;
    self.d=9; self.e=null; self.f="hi";
  }
}
