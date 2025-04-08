struct First {
  x: Int;
}

struct Second {
  y: First;
}

struct Third {
  z: Second;
}

contract NestedContract {
  field: Third;
  init() {
    self.field = Third { z: Second { y: First { x: 123 } } };
  }
}