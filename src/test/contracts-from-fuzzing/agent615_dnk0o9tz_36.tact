struct NestedDefaultsOpt {
  a: Int = 1;
  b: Bool? = null;
  c: Inner?;
}

struct Inner {
  x: Int? = null;
}

contract TestContract {
  s: NestedDefaultsOpt;

  init() {
    self.s = NestedDefaultsOpt{};
  }
}