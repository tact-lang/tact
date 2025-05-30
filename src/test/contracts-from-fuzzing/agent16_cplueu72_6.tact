message Msg {
  amount: Int;
}

contract Test {
  receive(msg: Msg) {
    let a = msg.amount;
  }
}