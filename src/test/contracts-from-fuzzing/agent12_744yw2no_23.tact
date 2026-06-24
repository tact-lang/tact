struct NestedDefaultsOpt {
  inner: Inner?;
}

struct Inner {
  foo: Int = 1;
  bar: Bool = false;
}

contract TestNestedDefaultsOpt {
  data: NestedDefaultsOpt;

  init() {
    self.data = NestedDefaultsOpt{};
  }
}
