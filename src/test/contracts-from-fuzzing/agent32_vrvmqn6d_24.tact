struct ManyOptionals {
  a: Int?;
  b: Int?;
  c: Int?;
  d: String?;
  e: Bool?;
}

contract Test {
  s: ManyOptionals;
  init() {
    self.s = ManyOptionals{a:null,b:null,c:null,d:null,e:null};
  }
}