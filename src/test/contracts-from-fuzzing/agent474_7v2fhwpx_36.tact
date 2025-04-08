struct TripleOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract Three {
  s1: TripleOpt;
  s2: TripleOpt;
  s3: TripleOpt;

  init() {
    self.s1 = TripleOpt{a:null,b:null,c:null};
    self.s2 = TripleOpt{a:5,b:true,c:null};
    self.s3 = TripleOpt{a:null,b:false,c:"x"};
  }
}
