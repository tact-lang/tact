struct PrimOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract NullablePrim {
  f: PrimOpt;
  init() {
    self.f = PrimOpt{ a:null, b:null, c:null };
  }
}