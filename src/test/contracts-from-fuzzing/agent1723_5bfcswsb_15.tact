contract MixedTypes {
  a: Int;
  b: String;
  c: Bool;
  d: Int?;
  e: String?;
  f: Bool?;
  g: Address;
  h: Address?;

  init() {
    self.a=1; self.b="x"; self.c=true; self.d=null; self.e=null; self.f=false;
    self.g = myAddress(); self.h = null;
  }
}