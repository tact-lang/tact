contract InitDefaults {
  val1: Int = 42;
  val2: Bool = true;
  val3: String = "abc";

  init() {
    // intentionally do not override defaults
  }
}
