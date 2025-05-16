struct OptNestedWithDefault {
  nested: Inner?;
  extra: Int;
}

struct Inner {
  a: Int = 10;
  b: Bool = false;
}

contract TestContract {
  data: OptNestedWithDefault;

  init() {
    self.data = OptNestedWithDefault{
      nested: Inner{},
      extra: 42
    };
  }
}