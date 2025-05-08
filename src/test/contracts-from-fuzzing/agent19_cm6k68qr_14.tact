struct X {
  a: Int;
}

message Y {
  b: X;
}

message Z {
  c: Y;
}

contract Test {
  receive(msg: Z) {
    // empty
  }
}