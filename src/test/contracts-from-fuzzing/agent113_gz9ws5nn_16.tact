struct LargeNested {
  s1: Sub1;
  s2: Sub2;
}

struct Sub1 {
  x: Int;
  y: String;
  z: Bool;
}

struct Sub2 {
  q: Int?;
  r: String?;
  s: Bool?;
}

contract TestLargeNested {
  data: LargeNested;

  init() {
    self.data = LargeNested{
      s1: Sub1{x:1,y:"a",z:true},
      s2: Sub2{q:null,r:null,s:null}
    };
  }
}