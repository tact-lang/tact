message M { x: Int; }

contract Test {
  receive(msg: M) {
    msg = M{ x: 5 };
    msg.x = 10;
  }
}