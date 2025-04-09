contract TestOptionalsValid {
  fun test() {
    // Valid usage of optionals
    let opt: Int? = null;
    let opt2: Int? = 42;
    if (opt2 != null) {
      dump(opt2!!); // Should dump 42
    }
    return;
  }
  receive() {
    self.test();
  }
}
