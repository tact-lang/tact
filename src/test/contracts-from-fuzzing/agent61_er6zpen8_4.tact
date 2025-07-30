message Foo {
  a: Int;
  b: Int;
}

contract Test {
  receive(message: Foo) {
    // Do nothing
  }
}