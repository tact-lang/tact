struct SubStruct {
  f: Int;
}

contract OptionalPrimPlusStruct {
  oi: Int?;
  os: SubStruct?;
  ob: Bool?;

  init() {
    self.oi = null;
    self.os = null;
    self.ob = null;
  }
}