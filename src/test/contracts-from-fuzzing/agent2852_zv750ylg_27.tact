struct NestedBool {
  f: Bool;
}

contract OptWrapBool {
  s: NestedBool?;

  init() {
    self.s = null;
  }
}