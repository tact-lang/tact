contract NestedOptionals {
  a: Int?;
  b: String?;
  sub: SubStruct?;

  init() {
    self.a = null;
    self.b = null;
    self.sub = null;
  }
}

struct SubStruct {
  x: Int;
  y: String;
}
