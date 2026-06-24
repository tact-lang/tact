message MyMsg {
  x: Int
}

contract Test {
  receive(msg: MyMsg) {
    let mm: MyMsg = msg;
  }
}