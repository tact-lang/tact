struct Base {
  a: Int;
}

struct Sub {
  base: Base;
  b: Int;
}

contract TestContract {
  s: Sub;

  init() {
    self.s = Sub{
      base: Base{ a: 5 },
      b: 10
    };
  }
}