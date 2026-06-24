struct A {
  i: Int;
  b: Bool;
  s: String;
}

struct B {
  j: Int?;
  c: A;
}

struct C {
  a: A;
  b: B;
  k: Int;
}

contract ManyNested {
  data: C;

  init() {
    self.data = C {
      a: A { i: 1, b: true, s: "a" },
      b: B { j: null, c: A { i: 2, b: false, s: "b" } },
      k: 3
    };
  }
}