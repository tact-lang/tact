struct Inner {
  flag: Bool;
}

struct NestedOptional {
  inner: Inner?;
}

contract Test {
  x: NestedOptional;

  init() {
    self.x = NestedOptional{ inner: null };
  }
}