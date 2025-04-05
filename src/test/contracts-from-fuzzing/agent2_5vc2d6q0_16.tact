contract Test {
  receive() {
    let c = crc32("hello world");
  }
}