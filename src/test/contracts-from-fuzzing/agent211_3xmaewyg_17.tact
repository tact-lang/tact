contract OnlyOptionals {
  oi: Int?;
  ob: Bool?;
  oa: Address?;
  oc: Cell?;
  os: Slice?;
  ostring: String?;

  init() {
    self.oi = null;
    self.ob = true;
    self.oa = null;
    self.oc = emptyCell();
    self.os = null;
    self.ostring = "hi";
  }
}
