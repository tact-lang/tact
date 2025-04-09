message A {
  val: Int;
}

message B {
  a: A;
}

message C {
  b: B;
}

contract Test {
  receive(msg: C) {
    // nested message
  }
}