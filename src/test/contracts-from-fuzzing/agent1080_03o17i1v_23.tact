struct A {
  val: Int;
}

struct B {
  a: A;
}

struct C {
  b: B;
}

struct D {
  c: C;
}

struct E {
  d: D;
}

struct F {
  e: E;
}

contract Nest6 {
  data: F;

  init() {
    self.data = F{
      e: E{
        d: D{
          c: C{
            b: B{
              a: A{ val: 999 },
            },
          },
        },
      },
    };
  }
}