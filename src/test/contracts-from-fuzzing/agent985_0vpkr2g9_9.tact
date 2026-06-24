struct OptionalNested {
  inner: Inner?;
}

struct Inner {
  x: Int;
}

contract OptionalNestedContract {
  optNest: OptionalNested;

  init() {
    self.optNest = OptionalNested{ inner: null };
  }
}