contract OptDefaultsOverride {
  a: Int?;

  init() {
    self.a = 3;
    self.a = null;
  }
}