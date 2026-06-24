message MyMessage {
  a: Int;
}

contract Test {
  receive(msg: MyMessage) {
    let x = msg.a + 1;
  }
}