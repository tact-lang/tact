struct BigOpt {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Bool?;
  e: Bool?;
  f: Bool?;
  g: Cell?;
  h: Cell?;
  i: Slice?;
  j: Slice?;
  k: String?;
  l: String?;
}

contract BigOptTest {
  val: BigOpt;

  init() {
    self.val = BigOpt {
      a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null,k:null,l:null
    };
  }
}
