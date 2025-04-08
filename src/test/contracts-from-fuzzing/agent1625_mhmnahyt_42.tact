contract PrimitiveDefaultsOverride {
  a: Int = 1;
  b: Int;
  c: Bool = false;
  d: Bool;

  init() {
    self.b = 2;
    self.d = true;
    self.a = 99;
    self.c = true;
  }
}
