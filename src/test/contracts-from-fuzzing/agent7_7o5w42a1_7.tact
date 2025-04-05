message Msg {
  b: Int;
}

contract Test {
  receive() {
    let m = Msg { b: 10 };
  }
}