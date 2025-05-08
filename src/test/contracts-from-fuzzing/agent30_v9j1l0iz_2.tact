fun testFun(a: Int): Int {
  return a + 1;
}

contract Test {
  receive() {
    testFun(123);
  }
}