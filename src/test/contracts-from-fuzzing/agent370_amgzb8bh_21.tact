struct First {
  x: Int;
}
struct Second {
  y: First;
}
struct Third {
  z: Second;
}

contract VeryNested {
  v: Third;

  init() {
    self.v = Third{ z: Second{ y: First{ x: 3 } } };
  }
}