message Msg {
  value: Int;
}

contract Test {
  receive(msg: Msg) {
    let v = msg.value;
  }
}