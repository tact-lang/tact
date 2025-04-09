struct Sub {
  f1: Int;
  f2: Int?;
  f3: Bool;
}

struct Container {
  c1: Sub;
  c2: Sub;
  flag: Bool;
  number: Int;
}

contract OptionalNestedMix {
  data: Container;

  init() {
    self.data = Container{
      c1: Sub{f1: 1, f2: null, f3: true},
      c2: Sub{f1: 2, f2: 3, f3: false},
      flag: true,
      number: 99
    };
  }
}