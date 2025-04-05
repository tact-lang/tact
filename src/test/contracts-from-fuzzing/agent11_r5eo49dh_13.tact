message A {
  data: Int;
}

message B {
  inner: A;
}

contract Test {
  receive(message: B) {
    return;
  }
}