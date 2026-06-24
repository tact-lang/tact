contract LargeNestedOptionals {
  s1: Inner?;
  s2: Inner?;
  s3: Inner?;
  s4: Inner?;
  s5: Inner?;

  init() {
    self.s1 = null;
    self.s2 = null;
    self.s3 = null;
    self.s4 = null;
    self.s5 = null;
  }
}

struct Inner {
  a: Int?;
  b: Bool?;
  c: String?;
}
