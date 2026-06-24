message Msg {
  value: Int;
}

contract Test {
  receive(msg: Msg) {
    msg.value = 999;
  }
}