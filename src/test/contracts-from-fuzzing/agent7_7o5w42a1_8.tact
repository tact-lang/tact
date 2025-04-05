message Msg {
  a: Int;
}

message AnotherMsg {
  m: Msg;
}

contract Test {
  receive() {
    let am = AnotherMsg { m: Msg { a: 5 } };
  }
}