struct Inner1 { a: Int; }
struct Inner2 { b: Int; c: Inner1; }
struct Inner3 { d: Int; e: Inner2; }
struct Inner4 { f: Int; g: Inner3; }
struct Inner5 { h: Int; i: Inner4; }

contract InliningTest {
  storage: Inner5;

  init() {
    self.storage = Inner5{
      h:1,
      i: Inner4{
        f:2,
        g: Inner3{
          d:3,
          e: Inner2{
            b:4,
            c: Inner1{ a:5 },
          },
        },
      },
    };
  }
}