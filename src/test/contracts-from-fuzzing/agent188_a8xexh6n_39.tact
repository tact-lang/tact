struct InnerOpt {
  a: Int?;
  b: Bool?;
}

contract OptStructField {
  sf: InnerOpt?;

  init() {
    self.sf = null;
  }
}