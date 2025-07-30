struct A {
  a1: Int;
  a2: Bool?;
}

struct B {
  b1: String;
  b2: A;
}

struct C {
  c1: Bool;
  c2: B;
  c3: Int?;
}

contract Test {
  state: C;

  init() {
    self.state = C{
      c1: true,
      c2: B{
        b1: "hello",
        b2: A{
          a1: 77,
          a2: false,
        },
      },
      c3: null,
    };
  }
}
