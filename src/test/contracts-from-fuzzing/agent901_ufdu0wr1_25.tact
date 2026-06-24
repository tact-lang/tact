struct Sub {
  b: Int;
}

struct Cont {
  a: Int;
  sub: Sub;
}

contract TestContract {
  x: Cont;

  init() {
    self.x = Cont {
      a: 5,
      sub: Sub { b: 10 }
    };
  }
}