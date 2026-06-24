struct NestedWithDefaults {
  foo: Int = 5;
  nest: SubNest;
}

struct SubNest {
  a: Int = 1;
  b: Bool = true;
}

contract NestedDefaults {
  s: NestedWithDefaults;

  init() {
    self.s = NestedWithDefaults{
      nest: SubNest{}
    };
  }
}
