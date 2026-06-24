fun test(): Int? {
  let x: Int? = null;
  return x;
}

contract Test {
  receive() {
    test();
  }
}