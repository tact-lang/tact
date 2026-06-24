struct A { x: Int; }
struct B { y: Int; }
struct Container {
  a: A;
  a2: A;
  b: B;
  b2: B;
}

contract RepeatsInStructs {
  store: Container;

  init() {
    self.store = Container{
      a: A{ x:1 },
      a2:A{ x:2 },
      b: B{ y:3 },
      b2:B{ y:4 }
    };
  }
}