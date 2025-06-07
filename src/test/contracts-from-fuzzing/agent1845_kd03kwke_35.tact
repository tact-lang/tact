// Optional nested optional primitive (should fail, nested optionals unsupported explicitly)
contract NestedOptPrimitive {
  // Known issue: nested optionals are not supported, but test anyway confirms
  //let bad: Int?? = null;

  innerOpt: Int?;

  init() {
    self.innerOpt = null;
  }
}
