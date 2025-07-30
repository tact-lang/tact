struct Cmpx {
  a: Int?;
  b: Bool;
}

contract WeirdOpt {
  field: Cmpx?;

  init() {
    self.field = null;
  }
}
