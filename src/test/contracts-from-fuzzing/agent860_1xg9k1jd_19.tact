struct Sub1 { x:Int; y:Int?; }
struct Sub2 { z:Bool; w:Bool?; }
struct Big {
  a:Sub1; b:Sub2;
  c:Sub1?; d:Sub2?;
}

contract NestedOpt {
  g:Big;
  init() {
    self.g = Big{
      a:Sub1{ x:1, y:null },
      b:Sub2{ z:true, w:null },
      c:null, d:null
    };
  }
}