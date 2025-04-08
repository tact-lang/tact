struct StrBoolInt {
  s: String?;
  b: Bool?;
  i: Int?;
}

contract OptAll {
  storage: StrBoolInt;

  init() {
    self.storage = StrBoolInt{
      s:null,
      b:null,
      i:null,
    };
  }
}