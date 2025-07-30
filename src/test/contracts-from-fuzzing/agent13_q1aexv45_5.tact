contract Maps {
  vals: map<Int, Int>;

  init() {
    self.vals = emptyMap();
    self.vals.set(1, 10);
  }
}