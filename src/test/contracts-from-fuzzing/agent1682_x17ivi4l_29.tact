struct NestedWithDefaults {
  a: Int = 1;
  b: Bool = true;
}

struct Container {
  c: NestedWithDefaults;
  d: NestedWithDefaults;
}

contract TestContract {
  val: Container;

  init() {
    self.val = Container{
      c: NestedWithDefaults{},
      d: NestedWithDefaults{}
    };
  }
}