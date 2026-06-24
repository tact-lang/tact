struct A {
  x: Int;
}

struct B {
  y: Int;
}

struct BigNest {
  a: A;
  b: B;
  c: A;
  d: B;
  e: A;
  f: B;
  g: A;
  h: B;
}

contract BigNestingTest {
  data: BigNest;

  init() {
    self.data = BigNest{
      a:A{x:1},b:B{y:2},c:A{x:3},d:B{y:4},
      e:A{x:5},f:B{y:6},g:A{x:7},h:B{y:8}
    };
  }
}
