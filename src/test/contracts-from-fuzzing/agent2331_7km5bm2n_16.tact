struct MultiOption {
  a: Int?;
  b: String?;
  c: Bool?;
}

contract Test {
  s: MultiOption;
  init() {
    self.s = MultiOption{a:null, b:null, c:null};
  }
}