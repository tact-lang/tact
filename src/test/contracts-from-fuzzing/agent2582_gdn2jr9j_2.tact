struct Nested {
  x: Int;
  y: Bool?;
}

struct Container {
  inner: Nested;
  flag: Bool;
}

contract Test {
  data: Container;

  init() {
    self.data = Container{
      inner: Nested{
        x: 42,
        y: null,
      },
      flag: false,
    };
  }
}
