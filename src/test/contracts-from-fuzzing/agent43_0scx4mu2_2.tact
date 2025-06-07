contract TestContract() {
  fun test() {
    let a: Int = 1;
    let b: Int = 2;
    let c = a + b; // Expected: 3
    return;
  }
  receive() {
    self.test();
  }
}
