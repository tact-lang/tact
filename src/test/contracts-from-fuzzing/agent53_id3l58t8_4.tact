message SimpleMessage {
  amount: Int;
}

contract Test {
  receive(msg: SimpleMessage) {
    let x = msg.amount;
  }
}