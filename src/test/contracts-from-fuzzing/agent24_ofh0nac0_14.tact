fun test(): Int {
  return ascii("A");
}

contract Test {
  receive() {
    test();
  }
}
