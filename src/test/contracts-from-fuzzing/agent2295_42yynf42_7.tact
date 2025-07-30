struct NestedWithDefaults {
  inner: Inner;
}

struct Inner {
  x: Int = 42;
  y: String = "hello";
}

contract Test {
  data: NestedWithDefaults;
  init() {
    self.data = NestedWithDefaults{
      inner: Inner{}
    };
  }
}