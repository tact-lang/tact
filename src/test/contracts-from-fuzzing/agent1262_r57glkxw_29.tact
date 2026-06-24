struct NestedDefault {
  a: Int = 11;
  b: Bool = false;
}

contract StructWithDefault {
  d: NestedDefault;

  init() {
    self.d = NestedDefault{};
  }
}