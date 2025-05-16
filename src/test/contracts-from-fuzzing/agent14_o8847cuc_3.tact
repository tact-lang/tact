contract TestCRC32 {
  const CRC: Int = crc32("000DEADBEEF000");
  receive() {
    // According to the docs, crc32("000DEADBEEF000") should equal 1821923098
    require(self.CRC == 1821923098, "CRC32 constant mismatch: expected 1821923098");
  }
}
