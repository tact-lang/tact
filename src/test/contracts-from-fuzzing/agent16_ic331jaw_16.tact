contract Test {
  receive() {
    let crc = crc32("hello world");
  }
}