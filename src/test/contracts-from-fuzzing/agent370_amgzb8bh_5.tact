struct NestedDefault {
  a: Int = 1;
  b: Bool = false;
  c: String = "x";
}

contract DefaultNest {
  nd: NestedDefault;

  init() {
    self.nd = NestedDefault{};
  }
}