contract OptionalAfterInit {
  i: Int;
  o: Int? = null;

  init() {
    self.i = 42;
  }
}