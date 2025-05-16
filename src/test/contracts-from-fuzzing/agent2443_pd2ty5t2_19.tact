contract MultiOptional {
    a: Int?; b: Int?; c: Int?;
    d: Bool?; e: Bool?;
    s1: String?; s2: String?;
    addr1: Address?; addr2: Address?;

    init() {
      self.a = null; self.b = null; self.c = null;
      self.d = null; self.e = null;
      self.s1 = null; self.s2 = null;
      self.addr1 = null; self.addr2 = null;
    }
}