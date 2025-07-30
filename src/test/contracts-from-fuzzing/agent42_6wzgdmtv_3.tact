struct Deep3 {
  d: Int;
}

struct Deep2 {
  c: Deep3;
}

struct Deep1 {
  b: Deep2;
}

contract TestContract {
  a: Deep1;

  init() {
    self.a = Deep1{ b: Deep2{ c: Deep3{ d: 123 } } };
  }
}