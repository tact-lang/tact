struct Nested {
  x: Int;
  y: Bool?;
  z: String;
}

struct Outer {
  first: Nested;
  second: Nested;
}

contract ComplexContract {
  data: Outer;

  init() {
    self.data = Outer{
      first: Nested{ x: 5, y: true, z: "hello" },
      second: Nested{ x: 10, y: null, z: "world" }
    };
  }
}