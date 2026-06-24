struct A { v: Int; }
struct B { b: Bool; }
struct Deep1 { a: A; }
struct Deep2 { b: B; }

struct Root {
  x: Int;
  d1: Deep1;
  d2: Deep2;
}

contract Test {
  r: Root;

  init() {
    self.r = Root{
      x: 7,
      d1: Deep1{a: A{v: 1}},
      d2: Deep2{b: B{b:true}}
    };
  }
}