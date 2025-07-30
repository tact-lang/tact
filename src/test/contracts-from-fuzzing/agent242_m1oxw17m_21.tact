struct NestedEmptyDefaults {
  inner: InnerWithDefaults;
}

struct InnerWithDefaults {
  a: Int = 5;
  b: Bool = false;
}

contract NestedDefaultsTest {
  f: NestedEmptyDefaults;

  init() {
    self.f = NestedEmptyDefaults{
      inner: InnerWithDefaults{},
    };
  }
}