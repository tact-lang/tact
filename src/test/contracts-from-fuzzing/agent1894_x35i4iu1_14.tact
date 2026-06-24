struct NestedDefaults {
  x: Int = 5;
  y: String = "Y";
}

struct OuterWithDefaults {
  a: NestedDefaults = NestedDefaults{};
  b: NestedDefaults = NestedDefaults{ x: 8, y: "Z" };
}

contract NestedStructDefaults {
  d: OuterWithDefaults;

  init() {
    self.d = OuterWithDefaults{};
  }
}