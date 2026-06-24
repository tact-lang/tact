struct NestedOptWithDef {
  x: Int? = null;
  y: Bool = false;
}

contract NestedOptDefaults {
  s: NestedOptWithDef;

  init() {
    self.s = NestedOptWithDef{};
  }
}