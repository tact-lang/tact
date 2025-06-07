struct InnerOpt {
  a: Int?;
  b: Bool?;
}
contract OptStructDefault {
  s: InnerOpt;
  init() {
    self.s = InnerOpt{ a:null, b:null };
  }
}
