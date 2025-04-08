struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: Int?;
  d: Bool?;
  e: Int?;
  f: Bool?;
}

contract OptMix {
  state: ManyOptionals;

  init() {
    self.state = ManyOptionals{a:null,b:true,c:3,d:null,e:5,f:false};
  }
}