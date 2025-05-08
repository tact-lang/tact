struct A {
  x: Int;
}

struct B {
  x: Int;
  a: A;
}

struct C {
  x: Int;
  b: B;
}

struct D {
  x: Int;
  c: C;
}

struct E {
  x: Int;
  d: D;
}

contract LevelFive {
  e: E;

  init() {
    self.e = E{
      x: 1,
      d: D{
        x: 2,
        c: C{
          x: 3,
          b: B{
            x: 4,
            a: A{
              x: 5
            }
          }
        }
      }
    };
  }
}
