struct NestedStructuralChain {
  a: Int;
  b: S1;
}

struct S1 {
  c: Int;
  d: S2;
}

struct S2 {
  e: Int;
  f: S3;
}

struct S3 {
  g: Int;
  h: S4;
}

struct S4 {
  i: Int;
  j: S5;
}

struct S5 {
  k: Int;
}

contract DeepChain {
  f: NestedStructuralChain;

  init() {
    self.f = NestedStructuralChain{
      a: 1,
      b: S1{
        c:2,
        d: S2{
          e:3,
          f: S3{
            g:4,
            h: S4{
              i:5,
              j: S5{ k:6 }
            }
          }
        }
      }
    };
  }
}