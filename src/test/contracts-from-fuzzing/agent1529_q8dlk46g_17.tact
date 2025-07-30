struct A {
  a: Int;
}

struct B {
  b: Int;
  a: A;
}

struct C {
  c: Int;
  b: B;
}

struct D {
  d: Int;
  c: C;
}

struct E {
  e: Int;
  d: D;
}

contract DeepWide {
  data: E;
  init(){
    self.data = E{
      e:1,
      d: D{
        d:2,
        c: C{
          c:3,
          b: B{
            b:4,
            a: A{ a:5 }
          }
        }
      }
    };
  }
}
