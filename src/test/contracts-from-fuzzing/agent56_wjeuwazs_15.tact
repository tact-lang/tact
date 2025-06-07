struct Custom {
  value: Int;
}

message MapWithStruct {
  dict: map<Int, Custom>;
}

contract Test {
  receive(msg: MapWithStruct) {}
}