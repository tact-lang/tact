struct InnerStruct {
    x: Int = 1;
    y: Bool = true;
}

struct NestedDefaults {
    sub: InnerStruct = InnerStruct{ x: 2, y: false };
    val: Int = 3;
    flag: Bool = false;
}

contract Test {
  data: NestedDefaults;
  init() {
    self.data = NestedDefaults{};
  }
}