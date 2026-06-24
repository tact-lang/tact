struct S1 {
  x: Int;
  y: Bool;
}

struct S2 {
  a: S1;
  b: S1;
  c: S1;
  d: S1;
  e: S1;
}

contract WideStructContract {
  s: S2;

  init() {
    self.s = S2{
      a: S1{x:1,y:true},
      b: S1{x:2,y:false},
      c: S1{x:3,y:true},
      d: S1{x:4,y:false},
      e: S1{x:5,y:true}
    };
  }
}