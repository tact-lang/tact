message ValidName {
  a: Int;
}

contract Test {
  receive(msg: ValidName) {
    let q = msg.a;
  }
}