struct A {
  val1: Int;
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

contract FiveLayerNested {
  val: E;

  init() {
    self.val = E{
      d: D{
        c: C{
          b: B{
            a: A{
              val1: 42
            }
          }
        }
      }
    };
  }
}