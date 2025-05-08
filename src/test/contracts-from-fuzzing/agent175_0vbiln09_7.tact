struct A { f1: Int }
struct B { f2: Int }
struct C { f3: Int }
struct D {
  a: A;
  b: B;
  c: C;
  opt: Int?;
}

contract Test {
  val: D;
  init() {
    self.val = D{
      a: A{f1:1},
      b: B{f2:2},
      c: C{f3:3},
      opt: null
    };
  }
}