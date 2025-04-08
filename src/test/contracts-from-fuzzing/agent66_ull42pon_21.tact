// Contract with many complex optional struct fields initialized with values
struct Sub {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract ManyOptionals {
  f1: Sub;
  f2: Sub;
  f3: Sub;

  init() {
    self.f1 = Sub{a: null, b: null, c: null};
    self.f2 = Sub{a: null, b: null, c: null};
    self.f3 = Sub{a: null, b: null, c: null};
  }
}