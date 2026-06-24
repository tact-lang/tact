struct L2 {
  z: Int;
}

struct L1 {
  y: L2;
}

struct Root {
  x: L1;
}

contract NestedStructFields {
  data: Root;

  init() {
    self.data = Root{ x: L1{ y: L2{ z: 42 } } };
  }
}