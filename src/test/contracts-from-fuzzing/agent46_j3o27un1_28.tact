message HasField {
  foo: Int
}

contract Test {
  receive(msg: HasField) {
    msg.foo = 10;
  }
}