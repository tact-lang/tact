struct Nested {
  inner: Inner;
}

struct Inner {
  flag: Bool;
  number: Int;
}

contract Test {
  data: Nested;

  init() {
    self.data = Nested{ inner: Inner{ flag: true, number: 42 } };
  }
}