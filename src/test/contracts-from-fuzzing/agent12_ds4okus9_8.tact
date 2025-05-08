message UserMsg {
    name: String;
    age: Int;
}

contract Test {
  receive(msg: UserMsg) {
    // do nothing
  }
}