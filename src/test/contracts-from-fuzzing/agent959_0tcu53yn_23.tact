struct InnerOpt {
  field: Int?;
}

contract OptStructInContract {
  optInner: InnerOpt?;
  init() {
    self.optInner = null;
  }
}