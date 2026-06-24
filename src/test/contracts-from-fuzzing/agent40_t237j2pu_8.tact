message MyMessage {
  a: Int;
  b: Int;
}

contract Test {
  receive(msg: MyMessage) {
    let y = msg.a + msg.b;
  }
}