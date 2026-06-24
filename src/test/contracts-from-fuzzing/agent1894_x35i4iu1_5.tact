struct OptionNest {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptionStructFields {
  f: OptionNest;

  init() {
    self.f = OptionNest{ a:null, b:null, c:null };
  }
}