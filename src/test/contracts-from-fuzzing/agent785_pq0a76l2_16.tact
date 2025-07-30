struct A {
  a: Int;
  b: Bool;
  c: String;
}

struct B {
  x: A;
  y: Int;
  z: Bool;
}

struct C {
  m: B;
  n: A;
  o: String;
}

contract ComplexNest {
  state: C;
  init() {
    self.state = C{
      m: B {
        x: A { a: 1, b: true, c: "s" },
        y: 2,
        z: false
      },
      n: A { a: 3, b: false, c: "t" },
      o: "end"
    };
  }
}
