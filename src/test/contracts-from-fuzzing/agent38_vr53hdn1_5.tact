contract TestBinaryOperators {
  receive() {
    let a: Int = 2 + 3;
    let b: Int = 2 * 3;
    let eq: Bool = (a == 5);
    let logic: Bool = ((2 < 3) && (3 < 4));
  }
}
