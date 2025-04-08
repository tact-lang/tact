contract PrimitivesAndOptionals {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  s: String;
  t: String?;

  init() {
    self.a = 1;
    self.b = null;
    self.c = false;
    self.d = true;
    self.s = "abc";
    self.t = null;
  }
}