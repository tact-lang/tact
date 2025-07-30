struct Nested {
  x: Int;
  y: Int;
}

contract TestContract {
  data: Nested; // nested struct as persistent field

  init() {
    self.data = Nested{ x: 1, y: 2 };
  }
}
