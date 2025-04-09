struct NestedDefaults {
  x: Int = 1;
  y: Bool = false;
}

struct OuterDefaults {
  in1: NestedDefaults;
  in2: NestedDefaults = NestedDefaults{};
}

contract StructNestedDefaultsTest {
  val: OuterDefaults;

  init() {
    self.val = OuterDefaults{
      in1: NestedDefaults{ x: 5, y: true }
    };
  }
}