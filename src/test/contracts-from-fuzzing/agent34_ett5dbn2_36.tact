message MessageWithMap {
  m: map<Int, Int>;
}

contract Test {
  receive(msg: MessageWithMap) {}
}