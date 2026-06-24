fun test(): Int {
  return ton("   1000  ");
}

contract Test {
  receive() {
    test();
  }
}
