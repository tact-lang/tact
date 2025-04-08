struct OptionalTuple {
  a: Int?;
  b: Int?;
  c: Int?;
}

contract OptionalGroup {
  val: OptionalTuple;

  init() {
    self.val = OptionalTuple{a:null, b:null, c:5};
  }
}