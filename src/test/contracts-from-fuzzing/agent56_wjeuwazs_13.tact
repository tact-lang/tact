message WithMap {
  dict: map<Int, Int>;
}

contract Test {
  receive(msg: WithMap) {}
}