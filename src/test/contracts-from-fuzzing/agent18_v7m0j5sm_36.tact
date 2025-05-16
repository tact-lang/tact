struct Sub1 { x:Int; y:Int?; }
struct Sub2 { z:Int; k:Int?; }

struct Top {
  a: Sub1; b:Sub2;
}

contract Topper {
  val: Top;

  init() {
    self.val = Top{
      a: Sub1{ x:1, y:null },
      b: Sub2{ z:2, k:3 }
    };
  }
}