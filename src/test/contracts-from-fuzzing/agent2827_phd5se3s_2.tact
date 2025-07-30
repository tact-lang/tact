struct Nested {
  a: Int;
  b: Bool;
  c: String;
}

struct Container {
  nested: Nested;
  value: Int;
}

contract Tester {
  dummy: Container;
  init() {
    self.dummy = Container{
      nested: Nested{a:1, b:true, c:"X"},
      value: 42
    };
  }
}
