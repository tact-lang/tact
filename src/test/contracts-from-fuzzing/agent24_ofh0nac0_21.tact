fun test(): Int {
  return ton("100000000000000000000000000000000000000000");
}

contract Test {
  receive() {
    test();
  }
}
