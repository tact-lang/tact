struct A {
  a: Int;
  b: String;
}

struct B {
  x: A;
  y: Int;
}

struct C {
  m: String;
  n: B;
}

contract MultiNesting {
  store: C;

  init() {
    self.store = C{
      m: "hi",
      n: B{
        x: A{ a: 10, b: "deep" },
        y: 42,
      },
    };
  }
}
