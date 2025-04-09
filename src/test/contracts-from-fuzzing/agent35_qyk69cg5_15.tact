message A {}

message B {
  a: A;
}

contract Test {
  receive() {
    let b = B{a: A{}};
  }
}