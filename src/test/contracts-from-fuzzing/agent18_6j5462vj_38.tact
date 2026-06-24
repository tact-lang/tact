struct S {
  a: Int;
  b: String;
}

struct T {
  s: S;
}

contract AssignInit {
  f: T;

  init() {
    self.f = T{ s: S{ a: 1, b: "abc" } };
  }
}