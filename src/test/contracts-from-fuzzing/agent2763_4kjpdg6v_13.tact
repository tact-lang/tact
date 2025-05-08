struct NestedDefaults {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
}

struct NestedContainer {
  nd: NestedDefaults;
}

contract DefaultsInit {
  inner: NestedContainer;

  init() {
    self.inner = NestedContainer{
      nd: NestedDefaults{},
    };
  }
}