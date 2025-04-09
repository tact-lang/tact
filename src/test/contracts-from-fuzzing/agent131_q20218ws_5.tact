struct A {
  a1: Int;
  a2: Bool;
}

struct B {
  b1: String;
  b2: Int?;
}

contract MultiStructs {
  foo: A;
  bar: B;
  yes: Bool;

  init() {
    self.foo = A{ a1: 1, a2: true };
    self.bar = B{ b1: "yo", b2: null };
    self.yes = false;
  }
}