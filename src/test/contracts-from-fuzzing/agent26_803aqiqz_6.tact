contract TestTonZero {
  // Testing compile-time evaluation of ton() with "0"
  // Expected: ton("0") should result in 0 because 0 Toncoin means 0 nanoToncoin
  const TON_ZERO: Int = ton("0");

  receive() {
    dump(self.TON_ZERO);
  }
}
