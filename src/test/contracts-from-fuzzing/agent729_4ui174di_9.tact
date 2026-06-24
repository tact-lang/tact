struct SOpt {
  x: Int?;
  s: String?;
}

contract OptInStruct {
  sfield: SOpt;

  init() {
    self.sfield = SOpt{x: null, s: null};
  }
}
