message Msg {
  a: Int;
}

message Another {
  m: Msg;
}

contract Test {
  receive(msg: Another) {
    let x = msg.m.a;
  }
}