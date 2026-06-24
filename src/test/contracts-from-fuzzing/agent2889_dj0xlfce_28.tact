struct Outer {
  s: String?;
}

contract OptionalStructField {
  val: Outer;

  init() {
    self.val = Outer{ s: null };
  }
}