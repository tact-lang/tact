struct Sub1 {
  a: Int as int64;
  b: Bool;
}

struct Sub2 {
  c: Int? as uint16;
  d: Bool?;
}

struct Super {
  s1: Sub1;
  s2: Sub2;
  e: Address;
}

contract Test {
  x: Super;
  init() {
    self.x = Super{
      s1: Sub1{a:1,b:true},
      s2: Sub2{c:null, d:false},
      e: myAddress()
    };
  }
}