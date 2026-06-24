struct OptionalNest {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract NestedOptsTest {
  rec: OptionalNest?;

  init() {
    self.rec = null;
  }
}
