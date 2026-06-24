message MyMessage {
  x: Int;
}

contract TestContract {
  receive(msg: MyMessage) {}
}