message Foo {
  f: Int;
}

contract Test {
  receive(msg: Foo) {
    msg.f = 42;
  }
}