fun test(): Int {
  return ton("");
}

contract Test {
  receive() {
    test();
  }
}
