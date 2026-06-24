message NUM {
  val: Int;
}

contract Test {
  receive(msg: NUM) {
    let sum = msg.val + msg.val;
  }
}