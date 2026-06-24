struct NestedWithDefaults {
  nested: WithDefaults;
}

struct WithDefaults {
  a: Int = 42;
  b: Bool = true;
}

contract NestedDefaults {
  val: NestedWithDefaults;

  init() {
    self.val = NestedWithDefaults{ nested: WithDefaults{} };
  }
}