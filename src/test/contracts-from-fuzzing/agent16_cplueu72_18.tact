message A {
  x: Int;
}

message B {
  y: Int;
}

struct C {
  a: A;
  b: B;
}

contract Test {
  receive(msg: A) {
    let x = msg.x;
  }
}