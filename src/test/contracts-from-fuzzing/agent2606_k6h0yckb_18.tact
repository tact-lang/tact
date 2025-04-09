struct ManyOpt {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Int?;
  g: Int?;
  h: Int?;
  i: Int?;
  j: Int?;
}

contract OptStruct {
  val: ManyOpt;

  init() {
    self.val = ManyOpt{
      a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
    };
  }
}