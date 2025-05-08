message OuterMsg {
  inner: InnerMsg
}

message InnerMsg {
  n: Int
}

contract Test {
  receive() {
    let m = OuterMsg{inner: InnerMsg{n: 123}};
  }
}