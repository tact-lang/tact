struct ManyOpt {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: String?;
  e: Bool?;
}

contract NullableFlood {
  opts: ManyOpt;
  init() {
    self.opts = ManyOpt{a:null,b:null,c:null,d:null,e:null};
  }
}