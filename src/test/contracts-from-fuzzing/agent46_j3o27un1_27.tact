message HasReserved {
  bounced: Int
}

contract Test {
  receive(msg: HasReserved) {}
}