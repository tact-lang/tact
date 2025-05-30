// verify optional non-null initialized in storage
contract Test {
  x: Int?;

  init() {
    self.x = 5;
  }
}