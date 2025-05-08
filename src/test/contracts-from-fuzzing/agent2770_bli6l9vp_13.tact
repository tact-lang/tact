contract NullInit {
  i: Int?;
  s: String?;

  init() {
    self.i = null;
    self.s = null;
  }
}