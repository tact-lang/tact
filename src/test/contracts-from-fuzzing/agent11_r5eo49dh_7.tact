message A {
  a: Int;
}

contract Test {
  receive(message: A) {
    return;
  }
}