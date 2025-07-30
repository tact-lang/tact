message WithBool {
  b: Bool;
}

contract Test {
  receive(msg: WithBool) {
    if (msg.b) {
    }
  }
}