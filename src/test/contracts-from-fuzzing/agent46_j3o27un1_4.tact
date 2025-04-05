message InnerMsg {
  n: Int
}

message OuterMsg {
  m: InnerMsg
}

contract Test {
  receive(msg: OuterMsg) {
    let num = msg.m.n;
  }
}