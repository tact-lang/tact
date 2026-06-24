message Msg {
  bounce: Bool
}

contract Test {
  receive(msg: Msg) {}
}