struct HasNestedDefaults {
  nested: Nested;
}

struct Nested {
  x: Int = 1;
  y: Bool = false;
}

contract NestedDefaults {
  state: HasNestedDefaults;

  init() {
    self.state = HasNestedDefaults{nested: Nested{}};
  }
}
