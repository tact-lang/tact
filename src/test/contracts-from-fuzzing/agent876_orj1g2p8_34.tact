contract ComplexSerialized {
  a: Int as uint8;
  b: Int? as int8;
  c: Int?;
  d: Int;
  e: Bool;
  f: Bool?;
  g: String?;

  init() {
    self.a=1; self.b=null; self.c=3;
    self.d=4; self.e=true; self.f=false; self.g="hi";
  }
}