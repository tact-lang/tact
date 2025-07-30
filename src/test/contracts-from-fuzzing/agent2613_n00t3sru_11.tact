struct NestedDefaults {
  a: Int = 7;
  b: Bool = false;
}

struct OuterWithNestedDefaults {
  inner: NestedDefaults;
  s: String;
}

contract NestedDefaultsTest {
  data: OuterWithNestedDefaults;

  init() {
    self.data = OuterWithNestedDefaults{
      inner: NestedDefaults{},
      s: "abc"
    };
  }
}