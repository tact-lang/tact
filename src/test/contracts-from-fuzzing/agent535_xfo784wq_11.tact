struct SOpt {
  val: Int?;
}

contract OptStructDefault {
  s: SOpt = SOpt{val: null};

  init() {
    self.s = SOpt{val: null};
  }
}