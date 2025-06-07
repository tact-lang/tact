message InnerMsg {
  b: Int;
}

message OuterMsg {
  inner: InnerMsg;
}

contract Test {
  receive() {
    let m = OuterMsg{ inner: InnerMsg{ b: 7 } };
  }
}