struct ManyOptional {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract LotsOfOptionals {
  val: ManyOptional;

  init() {
    self.val = ManyOptional{
      a:null,b:null,c:null,d:null,e:null,f:null
    };
  }
}