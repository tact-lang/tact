struct OptionalInt {
  x: Int?;
}

contract OptIntDefVals {
  val: OptionalInt;

  init() {
    self.val = OptionalInt{ x: null };
  }
}