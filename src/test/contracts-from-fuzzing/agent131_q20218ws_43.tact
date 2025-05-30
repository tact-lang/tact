struct D {
  a: Bool?; b: Int; c: String?;
}

contract NullSet {
  d: D;

  init() {
    self.d = D{ a:null,b:7,c:null };
  }
}