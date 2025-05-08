struct NestedDefaults {
  x: Int = 5;
}

struct NestedOuter {
  inner: NestedDefaults;
}

contract NestedDefaultVals {
  s: NestedOuter;

  init() {
    self.s = NestedOuter{
      inner: NestedDefaults{}
    };
  }
}
