message WithOptional {
  data: Int?;
}

contract Test {
  receive(msg: WithOptional) {
    let y = msg.data == null;
  }
}