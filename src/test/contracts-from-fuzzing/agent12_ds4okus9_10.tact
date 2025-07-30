message InnerMsg {
    value: Int;
}

message OuterMsg {
    inner: InnerMsg;
}

contract Test {
  receive(msg: OuterMsg) {
    // test nested messages
  }
}