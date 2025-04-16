message M {
  bounced: Bool;
}

contract Test {
  receive(m: M) {
    if (m.bounced) {
    }
  }
}