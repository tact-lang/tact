struct L {
  a: Int;
}

struct K {
  l: L;
}

struct J {
  k: K;
}

struct I {
  j: J;
}

struct H {
  i: I;
}

struct G {
  h: H;
}

struct F {
  g: G;
}

struct E {
  f: F;
}

struct D {
  e: E;
}

struct C {
  d: D;
}

struct B {
  c: C;
}

struct A {
  b: B;
}

contract MaxDepthNested {
  field: A;

  init() {
    self.field = A{
      b: B{
        c: C{
          d: D{
            e: E{
              f: F{
                g: G{
                  h: H{
                    i: I{
                      j: J{
                        k: K{
                          l: L{
                            a: 999
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    };
  }
}