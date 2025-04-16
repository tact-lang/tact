message WrappedMsg {
  value: Int
}

contract Test {
  receive(msg: WrappedMsg) {}
}