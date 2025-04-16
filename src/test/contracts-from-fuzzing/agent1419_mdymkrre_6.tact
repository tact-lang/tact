struct A {
  f1: Int;
  f2: B;
}

struct B {
  g1: Bool;
  g2: C;
}

struct C {
  h1: Int?;
  h2: String;
}

contract NestedChain {
  val: A;

  init() {
    self.val = A{
      f1:42,
      f2:B{
        g1:true,
        g2:C{
          h1:null,
          h2:"hi"
        }
      }
    };
  }
}