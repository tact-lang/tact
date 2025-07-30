struct A { a: Int }
struct B { b: Int; a: A }
struct C { c: Int; b: B }
struct D { d: Int; c: C }

contract MixNest {
  data: D;
  init() {
    self.data = D{
      d: 4,
      c: C{
        c: 3,
        b: B{
          b: 2,
          a: A{
            a:1
          }
        }
      }
    };
  }
}