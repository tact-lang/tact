contract NestedComplex {
  a: Int;
  b: Bool = true;
  c: Int?;
  d: String;

  init() {
    self.a = 10;
    self.c = null;
    self.d = "done";
  }
}