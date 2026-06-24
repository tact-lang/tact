contract SimpleOptionalTest {
  maybeInt: Int?;
  maybeBool: Bool?;

  init() {
    self.maybeInt = null;
    self.maybeBool = true;
  }
}