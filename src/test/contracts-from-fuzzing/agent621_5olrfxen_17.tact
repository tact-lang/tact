struct Sub {
  x: Int = 5;
  y: Int? = null;
}

struct Combo {
  a: Int = 1;
  b: Bool? = null;
  s: Sub;
}

contract CombineAll {
  data: Combo;
  init() {
    self.data = Combo{ a: 42, b: null, s: Sub{} };
  }
}