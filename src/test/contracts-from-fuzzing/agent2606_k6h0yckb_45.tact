contract DefaultsConflict {
  a: Int = 1;
  init() {
    self.a = 2;
  }
}