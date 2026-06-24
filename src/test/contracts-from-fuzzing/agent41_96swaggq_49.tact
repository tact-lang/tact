struct CrazyNest {
  a: Int?;
  b: Bool;
  c: Sub1;
}

struct Sub1 {
  d: Int;
  e: Sub2;
}

struct Sub2 {
  f: String?;
  g: Bool;
}

contract CrazyTypes {
  var: CrazyNest;

  init() {
    self.var = CrazyNest{
      a:null,
      b:true,
      c: Sub1{
        d:41,
        e: Sub2{
          f:null,
          g:false
        }
      }
    };
  }
}
