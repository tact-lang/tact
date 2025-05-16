struct NestedDeep {
  a: Int;
  b: Bool?;
}

contract TestContract {
  nd: NestedDeep?;
  init() {
    self.nd = null;
  }
}