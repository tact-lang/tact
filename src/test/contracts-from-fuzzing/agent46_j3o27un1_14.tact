message Wrap {
  c: Cell
}

contract Test {
  receive(msg: Wrap) {
    let cc = msg.c;
  }
}