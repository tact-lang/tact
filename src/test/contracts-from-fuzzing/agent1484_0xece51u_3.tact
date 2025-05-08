struct OptNest {
  u: Int?;
  v: Bool;
}

contract ContainsOptionalNested {
  val: OptNest;

  init() {
    self.val = OptNest{u: null, v: true};
  }
}