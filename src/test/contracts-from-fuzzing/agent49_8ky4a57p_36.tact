message M {
  r: Int;
}

contract Test {
  receive(msg: M) {
    let val = msg.r;
  }
  fun getX(msg: M): Int {
    return msg.r;
  }
}