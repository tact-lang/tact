struct Mix {
  a: Int;
  b: String?;
  c: Bool;
}

contract NestedOptionalMix {
  f: Mix?;

  init() {
    self.f = null;
  }
}