struct Child {
  flag: Bool;
}

struct Parent {
  one: Int;
  two: Int?;
  nested: Child;
}

contract OptionalNested {
  param1: Parent?;

  init() {
    self.param1 = Parent{
      one: 123,
      two: null,
      nested: Child{
        flag: true
      }
    };
  }
}