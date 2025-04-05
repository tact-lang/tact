message M { x: Int }

contract Test {
  receive(msg: M) {
    let a = msg.x;
    msg.x = 42;
  }
}