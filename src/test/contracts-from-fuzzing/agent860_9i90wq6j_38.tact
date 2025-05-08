struct SOpt {
  a: Int?;
}

contract StructWithOptDefault {
  s: SOpt = SOpt{a:null};

  init() {
    self.s = SOpt{a:null};
  }
}