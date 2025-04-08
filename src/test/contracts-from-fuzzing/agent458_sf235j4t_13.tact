struct A {
  i: Int = 1;
  s: String = "A";
}

struct B {
  a: A;
  bopt: Bool?;
}

struct C {
  b: B;
  copt: String?;
}

struct D {
  c: C;
  j: Int = 2;
}

contract VeryDeep {
  nested: D;

  init() {
    self.nested = D{
      c: C{
        b: B{
          a: A{
            i: 5,
            s: "changed"
          },
          bopt: true
        },
        copt: null
      },
      j: 999
    };
  }
}