struct Nested {
  innerVal: Int;
  flag: Bool?;
}

struct Container {
  field1: Int;
  nested: Nested;
  boolVal: Bool;
}

contract TestContract {
  c: Container;
  init() {
    self.c = Container{
      field1: 42,
      nested: Nested{ innerVal: 5, flag: false },
      boolVal: true,
    };
  }
}