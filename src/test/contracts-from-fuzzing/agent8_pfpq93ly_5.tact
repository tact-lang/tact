struct Data {
  x: Int;
}

message Msg {
  data: Data;
}

contract Test {
  receive() {
  }
}