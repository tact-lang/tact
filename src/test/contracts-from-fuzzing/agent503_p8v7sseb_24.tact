contract OptionalIntInit {
  count: Int? = 5;

  init() {
    self.count = 42;
  }
}
