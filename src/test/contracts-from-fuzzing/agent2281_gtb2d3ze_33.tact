contract OptionalSerialize {
  v: Int? as uint32;

  init() {
    self.v = null;
  }
}