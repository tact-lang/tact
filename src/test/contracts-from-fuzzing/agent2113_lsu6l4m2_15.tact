struct SOpt {
  a: Int?;
  b: Bool?;
}

contract TopOpt {
  v: SOpt?;

  init() {
    self.v = null;
  }
}