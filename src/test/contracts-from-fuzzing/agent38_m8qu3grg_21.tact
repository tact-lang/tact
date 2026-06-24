message Msg {
  bounced: Int
}

contract Test {
  receive(msg: Msg) {}
}