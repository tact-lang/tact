message InnerMsg {
  a: Int
}

message OuterMsg {
  inner: InnerMsg
}

contract Test {
  receive() {
    let m = OuterMsg{inner: InnerMsg{a: 10}};
  }
}