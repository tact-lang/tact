struct A { x: Int; y: Bool; }
struct B { z: String; inner: A; }
struct C { a: A; b: B; }

contract Combo {
  data: C;
  init() {
    self.data = C{
      a: A{x:1,y:true},
      b: B{z:"hi",inner:A{x:2,y:false}}
    };
  }
}