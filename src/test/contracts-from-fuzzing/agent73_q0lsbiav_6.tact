contract Test {
  oi: Int?;
  ob: Bool?;
  os: String?;
  oa: Address?;
  oc: Cell?;
  osl: Slice?;

  init() {
    self.oi = null;
    self.ob = true;
    self.os = "hi";
    self.oa = myAddress();
    self.oc = emptyCell();
    self.osl = emptyCell().asSlice();
  }
}
