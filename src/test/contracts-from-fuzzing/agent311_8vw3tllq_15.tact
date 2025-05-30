struct Deep {
  a: A;
}

struct A {
  b: B;
}

struct B {
  c: C;
}

struct C {
  d: D;
}

struct D {
  e: E;
}

struct E {
  f: Int;
}

contract Chain {
  store: Deep;

  init() {
    self.store = Deep{
      a: A{
        b: B{
          c: C{
            d: D{
              e: E{
                f: 99
              }
            }
          }
        }
      }
    };
  }
}