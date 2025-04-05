message A {
  f: Int;
}

message B {
  g: Int;
}

contract Test {
  receive(msg: A) {
    let f = msg.f;
  }

  receive(msg: B) {
    let g = msg.g;
  }
}