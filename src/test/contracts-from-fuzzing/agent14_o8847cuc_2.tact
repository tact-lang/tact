contract Test {
  const TON_ONE: Int = ton("1");
  const ASCII_LIGHTNING: Int = ascii("⚡");
  receive() {
      require(self.TON_ONE == 1000000000, "TON mismatch");
      require(self.ASCII_LIGHTNING == 14850721, "ASCII mismatch");
  }
}