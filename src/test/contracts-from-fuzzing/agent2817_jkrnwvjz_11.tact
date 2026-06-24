struct SOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptionalVars {
  s: SOpt;

  init() {
    self.s = SOpt{ a:null, b:null, c:null };
  }
}
