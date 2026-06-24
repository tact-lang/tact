struct Nested {
  x: Int;
  y: Bool;
}

struct Container {
  first: Nested;
  second: Nested;
  text: String;
}

contract StructDeepTest {
  data: Container;

  init() {
    self.data = Container{
        first: Nested{x: 1, y: true},
        second: Nested{x: 2, y: false},
        text: "hello"
    };
  }
}