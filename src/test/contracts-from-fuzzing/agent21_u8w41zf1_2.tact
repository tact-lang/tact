struct Layer2 {
  x: Int;
  y: Bool;
}

struct Layer1 {
  a: Int;
  b: Layer2;
  c: Bool?;
}

contract DeepNestedStorage {
  layer: Layer1;

  init() {
    self.layer = Layer1{
      a: 10,
      b: Layer2{x: 1, y: false},
      c: null
    };
  }

  receive() {}
}