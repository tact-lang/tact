contract ManyTopLevelOptionals {
  oi1: Int?;
  oi2: Int?;
  oi3: Int?;
  ob1: Bool?;
  ob2: Bool?;
  os1: String?;
  os2: String?;
  oa1: Address?;
  oa2: Address?;

  init() {
    self.oi1 = null; self.oi2 = null; self.oi3 = null;
    self.ob1 = null; self.ob2 = null;
    self.os1 = null; self.os2 = null;
    self.oa1 = null; self.oa2 = null;
  }
}
