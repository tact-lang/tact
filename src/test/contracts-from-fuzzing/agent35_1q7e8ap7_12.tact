contract Test {
  receive() {
    let i = crc32("garbage");
  }
}