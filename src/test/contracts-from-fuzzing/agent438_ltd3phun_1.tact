struct Nested {
  inner1: Int;
  inner2: Bool?;
}

struct Outer {
  nested: Nested;
  flag: Bool;
}

contract TestContract {
  st: Outer;

  init() {
    self.st = Outer{
      nested: Nested{ inner1: 1, inner2: false },
      flag: true,
    };
  }
}