struct SOpt {
  value: Int?;
  flag: Bool?;
}

contract OptNested {
  sopt: SOpt;

  init() {
    self.sopt = SOpt{ value: null, flag: null };
  }
}