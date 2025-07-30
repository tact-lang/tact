message A {
  foo: Int;
}

contract Test {
  receive(msg: A) {
    msg.foo = 5;
  }
}