fun test(): Slice {
  return rawSlice("");
}

contract Test {
  receive() {
    test();
  }
}