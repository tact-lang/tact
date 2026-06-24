struct Sub1 { a: Int; }
struct Sub2 { b: Int; }

struct Holder {
  s1: Sub1;
  s2: Sub2;
}

contract MultipleNests {
  h: Holder;

  init() {
    self.h = Holder{ s1: Sub1{ a: 1 }, s2: Sub2{ b: 2 } };
  }
}