struct InnerToo {
  inside: Int;
}

contract ManyFields {
  a: Int;
  b: String;
  c: Bool;
  d: Bool?;
  e: String?;
  f: Int?;
  g: InnerToo;

  init() {
    self.a = 1;
    self.b = "b";
    self.c = true;
    self.d = null;
    self.e = null;
    self.f = null;
    self.g = InnerToo { inside: 99 };
  }
}