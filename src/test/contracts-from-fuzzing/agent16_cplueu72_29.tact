message Sum {
  a: Int;
  b: Int;
}

contract Test {
  receive(msg: Sum) {
    let total = msg.a + msg.b;
  }
}