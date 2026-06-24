fun test(): Int {
  return ton("-1.5");
}

contract Test {
  receive() {
    test();
  }
}
