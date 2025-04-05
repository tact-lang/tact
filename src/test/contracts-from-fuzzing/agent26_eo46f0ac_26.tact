message HasBool {
  ok: Bool;
}

contract Test {
  receive(msg: HasBool) {
    if (msg.ok) {}
  }
}