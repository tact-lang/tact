message MyMessage {
  x: Int;
}

contract BounceTest1 {
  bounced(msg: bounced<MyMessage>) {
    // no-op
  }
}
