message SimpleMessage {
  x: Int;
}

contract TestContract {
  receive(msg: SimpleMessage) {
    let y = msg.x;
  }
}