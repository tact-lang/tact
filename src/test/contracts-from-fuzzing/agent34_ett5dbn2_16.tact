message A {
  a: Int;
}

message B {
  b: Int;
}

contract Test {
  receive(msg: B) {
    // do nothing
  }
}