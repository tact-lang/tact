struct OptInner {
  val: Int?;
}

contract TestOptStructField {
  optData: OptInner;

  init() {
    self.optData = OptInner{ val: null };
  }
}
