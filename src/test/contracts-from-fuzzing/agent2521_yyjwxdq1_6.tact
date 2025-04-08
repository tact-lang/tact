struct Inner {
  x: Int?;
  y: Bool = true;
}

struct Outer {
  inner: Inner?;
}

contract NestedOptions {
  data: Outer?;

  init() {
    self.data = Outer{ inner: Inner{ x: 5, y: false } };
  }
}
