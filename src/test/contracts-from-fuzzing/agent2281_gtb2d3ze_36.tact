struct Special {
  a: Int? as int32;
  b: Bool?;
  c: String?;
}

contract SpecialOptFields {
  data: Special;

  init() {
    self.data = Special { a:null, b:null, c:null };
  }
}