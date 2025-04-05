contract TestAscii {
  const A: Int = ascii("abc");
  receive() {
    require(self.A == 6382179, "ascii(\"abc\") failed");
  }
}
