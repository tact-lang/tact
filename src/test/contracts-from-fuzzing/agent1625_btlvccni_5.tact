struct NestedWithDefaults {
  x: Int = 5;
  y: Bool = true;
}

contract DefaultInNested {
  data: NestedWithDefaults;

  init() {
    self.data = NestedWithDefaults{};
  }
}
