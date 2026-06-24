struct Data {
  x: Int;
}

message Msg {
  data: Data;
}

contract Test {
  receive(msg: Msg) {
    let y = msg.data.x;
  }
}