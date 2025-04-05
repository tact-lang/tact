message Msg {
  a: Int;
}

contract Test {
  receive(msg: Msg) {
    let x = msg.a;
  }
}

contract Other {
  receive(msg: Msg) {
    let y = msg.a;
  }
}