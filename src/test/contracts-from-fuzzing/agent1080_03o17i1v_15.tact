contract BoolDefaults {
  ok: Bool = false;
  done: Bool = true;
  maybe: Bool?;

  init() {
    self.maybe = null;
  }
}