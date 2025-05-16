message Empty {}

contract Test {
  receive(msg: Empty) {
    dump(0);
  }
}