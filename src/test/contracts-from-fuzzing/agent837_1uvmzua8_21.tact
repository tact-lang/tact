struct Zero {
  a: Int = 0;
  b: Bool = false;
  c: String = "";
}

contract ZeroDefaults {
  s: Zero;

  init() {
    self.s = Zero{};
  }
}