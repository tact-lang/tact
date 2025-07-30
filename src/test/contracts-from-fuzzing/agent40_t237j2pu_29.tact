message WeirdName123_ABC {
  foo: Int;
}

contract Test {
  receive(msg: WeirdName123_ABC) {
    let v = msg.foo + 1;
  }
}