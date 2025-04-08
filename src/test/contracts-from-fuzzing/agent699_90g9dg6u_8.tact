struct ManyOptionals {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Int?;
  e: String?;
  f: Bool?;
  g: Int?;
  h: String?;
  i: Bool?;
}

contract OptionalBomb {
  storage: ManyOptionals;

  init() {
    self.storage = ManyOptionals{
      a:null, b:"hi", c:true, d:4, e:null, f:false, g:null, h:null, i:true
    };
  }
}