struct InnerDef {
  v: Int = 11;
}

contract OptOuterNull {
  outer: InnerDef?;

  init() {
    self.outer = null;
  }
}
