message A {
  x: Int;
}

message B {
  y: A;
}

message C {
  z: B;
}

contract Test {
  receive(msg: C) {
    let a = msg.z.y.x;
  }
}