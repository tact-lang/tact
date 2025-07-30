struct Child {
  v: Int;
}

struct Parent {
  first: Child?;
  second: Child?;
}

contract NestedOptionalStructs {
  data: Parent;

  init() {
    self.data = Parent{
      first: null,
      second: Child{ v: 42 }
    };
  }
}
