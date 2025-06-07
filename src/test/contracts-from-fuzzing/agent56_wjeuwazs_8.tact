message SingleField {
  flag: Bool;
}

contract Test {
  receive(msg: SingleField) {}
}