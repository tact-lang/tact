message BounceFlag {
  bounced: Bool
}

contract Test {
  receive(msg: BounceFlag) {
    if (msg.bounced) {}
  }
}