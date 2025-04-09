fun test(): Int {
  return crc32("hello");
}

contract Test {
  receive() {
    test();
  }
}
