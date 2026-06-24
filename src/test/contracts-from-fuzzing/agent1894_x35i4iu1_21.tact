struct NestedOptStruct {
  inner: Int?;
}

contract OptStructSet {
  s: NestedOptStruct?;

  init() {
    self.s = null;
  }
}