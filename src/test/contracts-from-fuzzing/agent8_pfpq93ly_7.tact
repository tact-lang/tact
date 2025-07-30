message InnerMsg {
  x: Int;
}

message OuterMsg {
  inner: InnerMsg;
}

contract Test {
  receive() {}
}