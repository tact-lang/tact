struct Nested1 {
  x: Int;
  y: Int;
}

struct Nested2 {
  z: Nested1;
  w: Bool;
}

contract TestDeepNested {
  info: Nested2;
  
  init() {
    self.info = Nested2{z: Nested1{x: 1, y: 2}, w: true};
  }
}