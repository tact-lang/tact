struct A {
  x: Int;
  y: Bool;
}

struct B {
  left: A;
  right: A;
}

contract Test {
  pair: B;
  init() {
    self.pair = B{ left: A{x:1,y:true}, right: A{x:2,y:false} };
  }
}