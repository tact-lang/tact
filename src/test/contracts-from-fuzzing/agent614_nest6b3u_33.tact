contract NestedSerialization {
  a: Int as uint32;
  b: String?;
  c: Bool;
  d: Int as int64;
  e: Int as uint8;

  init() {
    self.a=1;
    self.b="q";
    self.c=true;
    self.d=42;
    self.e=2;
  }
}