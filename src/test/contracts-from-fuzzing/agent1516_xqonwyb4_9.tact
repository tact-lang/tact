struct A {
  a: Int;
  b: Int;
}

struct B {
  ba: A;
  c: Int;
}

struct C {
  cb: B;
  d: Int?;
}

struct D {
  dc: C;
  e: Bool?;
}

contract Layered {
  data: D;

  init() {
    self.data = D{
      dc: C{
        cb: B{
          ba: A{ a: 10, b: 20 },
          c: 30
        },
        d: null
      },
      e: true
    };
  }
}