contract DefaultsOverride {
  first: Int = 1;
  second: String = "hi";

  init() {
    self.second = "bye";
  }
}
