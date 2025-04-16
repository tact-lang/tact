struct OptionCombo {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: String?;
}

contract OptionStructCombo {
  v1: OptionCombo;
  v2: OptionCombo;

  init() {
    self.v1 = OptionCombo{ a:null, b:true, c:null, d:"abc" };
    self.v2 = OptionCombo{ a:5, b:null, c:null, d:null };
  }
}