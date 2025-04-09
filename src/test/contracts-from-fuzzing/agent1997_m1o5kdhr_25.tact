struct SubNest {
  flag: Bool;
  count: Int as uint4 = 1;
  descrip: String?;
}

contract FuzzMix {
  valA: Int as uint8;
  optStr: String?;
  deep: SubNest;

  init() {
    self.valA = 7;
    self.optStr = null;
    self.deep = SubNest{
      flag: true,
      descrip: null
    };
  }
}
