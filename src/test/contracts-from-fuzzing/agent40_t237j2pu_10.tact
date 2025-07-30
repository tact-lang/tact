message MyMessage {
  a: Int;
}

contract Test {
  receive(msg: MyMessage) {
    let m: MyMessage = MyMessage { a: 5 };
  }
}