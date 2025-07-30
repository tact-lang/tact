struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct Top {
  a: A;
  b: B;
  c: C;
}

contract MultiStruct {
  val: Top;

  init() {
    self.val = Top{
      a: A{a:1},
      b: B{b:2},
      c: C{c:3}
    };
  }
}