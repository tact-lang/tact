contract FullyOptionalInit {
  f: Int?;

  init() {
    self.f = null;
  }
}