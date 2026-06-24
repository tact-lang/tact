message Msg {
  bounced: Bool
}

contract Test {
  receive(msg: Msg) {}
}