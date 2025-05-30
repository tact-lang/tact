message TestMsg {
  value: Int;
}

contract Test {
  receive(msg: TestMsg) {
    let copy: TestMsg = msg;
  }
}