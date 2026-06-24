struct A {
  x: Int;
  y: Bool;
}

struct B {
  a: A;
  b: A;
}

struct C {
  b1: B;
  b2: B;
}

contract Nest4 {
  deep: C;

  init() {
    self.deep = C{
      b1: B{ a: A{x:1,y:true}, b: A{x:2,y:false} },
      b2: B{ a: A{x:3,y:true}, b: A{x:4,y:false} }
    };
  }
}
