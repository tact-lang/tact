struct Defaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "hi";
}

contract NestedDefaults {
  nested: Defaults = Defaults{};
  init() {
    self.nested = Defaults{};
  }
}