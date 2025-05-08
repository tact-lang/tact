message Msg1 {
  value: Int;
}

message Msg2 {
  text: String;
}

contract Test {
  receive(msg: Msg1) {
    let v = msg.value;
  }
}