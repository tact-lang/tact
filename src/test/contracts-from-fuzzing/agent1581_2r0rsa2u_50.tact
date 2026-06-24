struct A { n: Int; }
struct B { a: A; }

struct C {
  x: Int;
  b: B;
  m: Bool;
}

contract DeepMix {
  f: C;

  init() {
    self.f = C{
      x:5,
      b: B{
        a: A{ n:10 }
      },
      m:true
    };
  }
}