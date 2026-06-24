struct Levels3 {
  a: Int;
}

struct Levels2 {
  inner: Levels3;
}

struct Levels1 {
  inner: Levels2;
}

contract VeryNested {
  n: Levels1;

  init() {
    self.n = Levels1{ inner: Levels2{ inner: Levels3{ a:123 } } };
  }
}