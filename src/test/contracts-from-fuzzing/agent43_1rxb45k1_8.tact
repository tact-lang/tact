message M { x: Int }

contract Test {
  receive(msg: M) {
    msg.x = 5;
  }
}