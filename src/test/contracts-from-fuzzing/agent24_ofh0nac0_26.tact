fun test(): Int {
  return ton("-9223372036854775808");
}

contract Test {
  receive() {
    test();
  }
}
