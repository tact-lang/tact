message NestedMsg {
  inner: InnerMsg;
}

message InnerMsg {}

contract Test {
  receive(msg: NestedMsg) {
  }
}