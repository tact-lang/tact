struct NestedDefaults {
  s: InnerDefault;
}

struct InnerDefault {
  x: Int = 1;
  y: Bool = true;
}

contract NestedDefsTest {
  data: NestedDefaults;

  init() {
    self.data = NestedDefaults{
      s: InnerDefault{}
    };
  }
}