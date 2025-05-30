struct S {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Int?;
  g: Int?;
  h: Int?;
}

contract ManyOptionalNested {
  s: S?;

  init() {
    self.s = null;
  }
}