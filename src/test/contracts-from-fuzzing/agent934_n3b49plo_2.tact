struct Nested {
  inner: Inner;
  flag: Bool;
}

struct Inner {
  x: Int;
  y: Int;
}

contract Test {
  state: Nested;

  init() {
    self.state = Nested{
      inner: Inner{ x: 10, y: 20 },
      flag: false
    };
  }
}