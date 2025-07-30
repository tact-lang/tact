struct First {
  foo: Int;
}

struct Second {
  bar: Bool;
}

struct Third {
  a: First;
  b: Second;
}

contract TestContract {
  t: Third;
  init() {
    self.t = Third{a: First{foo: 1}, b: Second{bar: false}};
  }
}