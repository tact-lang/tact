struct NestedDefaults {
  x: Int = 42;
  y: Bool = true;
}

contract StructWithDefaults {
  data: NestedDefaults = NestedDefaults{};
  init() {
    self.data = NestedDefaults{ x:100, y:false };
  }
  receive() {}
}