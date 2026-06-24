message A {
  a: Int;
}

message B {
  b: Int;
}

contract Test {
  receive(msg: A) {
    // do nothing
  }
}