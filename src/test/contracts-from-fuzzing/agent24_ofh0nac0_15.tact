fun test(): Int {
  return crc32("");
}

contract Test {
  receive() {
    test();
  }
}
