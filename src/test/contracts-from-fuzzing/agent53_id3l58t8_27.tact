message ZeroBits {
  items: Slice;
}

contract Test {
  receive(msg: ZeroBits) {
    let s = msg.items;
  }
}