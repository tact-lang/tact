message HasOpt {
  x: Int?;
}

contract Test {
  receive(msg: HasOpt) {
    let z = msg.x;
  }
}