message MapMsg {
  items: map<Int, Int>;
}

contract Test {
  receive(msg: MapMsg) {
    // test map in message
  }
}