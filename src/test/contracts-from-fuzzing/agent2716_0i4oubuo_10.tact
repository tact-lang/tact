struct ManyOpts {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract OptsTest {
  data: ManyOpts;

  init() {
    self.data = ManyOpts{a:null,b:null,c:null,d:null,e:null,f:null};
  }
}