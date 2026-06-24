message M {
  f1: Int;
}

message N {
  f2: Int;
}

contract Test {
  receive(msg: M) {
    // handle M
  }
  receive(msg: N) {
    // handle N
  }
}
