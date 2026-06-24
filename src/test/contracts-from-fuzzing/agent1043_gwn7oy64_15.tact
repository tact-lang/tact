struct S {
  a: Int;
}

trait T {
  s: S;
}

contract C with T {
  s: S;
  init() {
    self.s = S{ a: 10 };
  }
}