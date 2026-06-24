struct Nested {
  val1: Int;
  val2: Int;
}

struct Outer {
  inner: Nested;
  flag: Bool;
}

contract ComplexStorage {
  data: Outer;

  init() {
    self.data = Outer{
      inner: Nested{ val1: 1, val2: 2 },
      flag: true
    };
  }
}