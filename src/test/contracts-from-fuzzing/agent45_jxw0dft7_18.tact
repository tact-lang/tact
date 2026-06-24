message MsgA {
  a: Int;
}

message MsgB {
  b: Int;
}

contract TestContract {
  receive(msg: MsgA) {
    let x = msg.a;
  }
}