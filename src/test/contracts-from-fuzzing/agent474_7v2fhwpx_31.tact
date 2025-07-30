struct A { x: Int }
struct B { y: Int }
struct C {
  sa: A;
  sb: B;
  optA: A?;
  optB: B?;
}

contract Test {
  f: C;
  init() {
    self.f = C{
      sa: A{ x:1 },
      sb: B{ y:2 },
      optA: null,
      optB: B{ y:3 }
    };
  }
}
