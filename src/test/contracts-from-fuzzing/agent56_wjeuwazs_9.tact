message WithOptional {
  num: Int?;
}

contract Test {
  receive(msg: WithOptional) {}
}