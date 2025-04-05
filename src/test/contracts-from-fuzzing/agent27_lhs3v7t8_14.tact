message A {
  s: String;
}

contract Test {
  receive(msg: A) {
    let t = msg.s;
  }
}