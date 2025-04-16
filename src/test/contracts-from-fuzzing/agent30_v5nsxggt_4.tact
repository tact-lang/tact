contract Test {
  x: Int = 0;
  receive() {
    let value = self.x;
  }
}