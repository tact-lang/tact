contract LongFlatMixed {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: String;
  f: Int?;
  g: Bool = true;
  h: String = "hi";
  i: Int = 42;
  j: String?;
  k: Bool = false;

  init() {
    self.a = 1;
    self.b = true;
    self.c = 2;
    self.d = null;
    self.e = "abc";
    self.f = null;
    self.j = "yes";
  }
}
