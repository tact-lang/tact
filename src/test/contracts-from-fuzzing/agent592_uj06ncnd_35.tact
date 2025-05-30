struct NestedOptStruct {
  a: Int?;
  b: String?;
}

contract OptTop {
  f: NestedOptStruct?;
  g: Bool;

  init() {
    self.f = null;
    self.g = true;
  }
}