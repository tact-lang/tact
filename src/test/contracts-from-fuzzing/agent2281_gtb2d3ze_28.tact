struct OptInner {
  v: Int?;
}

contract OptStructField {
  f: OptInner?;

  init() {
    self.f = OptInner{v:null};
  }
}