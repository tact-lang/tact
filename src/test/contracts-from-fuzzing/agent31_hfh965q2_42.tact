struct BigOptional {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
  e: Bool?;
}

contract Test {
  data: BigOptional;

  init() {
    self.data = BigOptional{a:null,b:null,c:null,d:null,e:null};
  }
}