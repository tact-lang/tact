message MapMsg {
  data: map<Int, Int>;
}

contract Test {
  receive(msg: MapMsg) {}
}