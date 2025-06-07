message A {
  a: Int
}

message B {
  b: A
}

contract Test {
  receive() {
    // do nothing
  }
}