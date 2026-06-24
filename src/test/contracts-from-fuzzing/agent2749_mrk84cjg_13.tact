struct NestedMany {
  a: Int;
  b: String;
  c: Bool;
  d: String?;
  e: Int?;
  f: Bool?;
}

contract MultiOpt {
  inner: NestedMany?;
  inner2: NestedMany?;

  init() {
    self.inner = null;
    self.inner2 = null;
  }
}