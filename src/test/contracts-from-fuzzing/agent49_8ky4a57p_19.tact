struct Wrapper {
  m: Msg;
}

message Msg {
  amount: Int;
}

contract Test {
  receive() {
    let a: Int = 0;
  }
}