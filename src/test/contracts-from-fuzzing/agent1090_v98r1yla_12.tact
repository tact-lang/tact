struct BigNest1 {
  a: Int;
  b: Int;
}
struct BigNest2 {
  a: BigNest1;
  b: BigNest1;
}
struct BigNest3 {
  a: BigNest2;
  b: BigNest2;
}
contract DoubleNestedBig {
  inner: BigNest3;

  init() {
    self.inner = BigNest3{
      a: BigNest2{
        a: BigNest1{a:1,b:2},
        b: BigNest1{a:3,b:4}
      },
      b: BigNest2{
        a: BigNest1{a:5,b:6},
        b: BigNest1{a:7,b:8}
      }
    };
  }
}