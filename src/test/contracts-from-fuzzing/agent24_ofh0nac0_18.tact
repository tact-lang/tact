fun test(): Int {
  return ton("1000000000");
}

contract Test {
  receive() {
    test();
  }
}
