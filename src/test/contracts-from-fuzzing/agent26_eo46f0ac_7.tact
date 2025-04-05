message Msg {
  text: String;
  amount: Int;
}

contract Test {
  receive(msg: Msg) {
    let t = msg.text;
    let a = msg.amount;
  }
}