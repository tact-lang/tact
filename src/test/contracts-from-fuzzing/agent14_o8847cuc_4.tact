contract TestMoon {
  const MOON: Int = 1730 + (8 | 8);
  receive() {
    require(self.MOON == 1738, "Moon constant evaluation failed");
  }
}
