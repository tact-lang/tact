struct S1 {
  f: Int;
}

struct S2 {
  g: S1;
}

struct S3 {
  h: S2;
}

struct S4 {
  i: S3;
}

contract Nested4 {
  j: S4;

  init() {
    self.j = S4{
      i: S3{
        h: S2{
          g: S1{
            f: 42,
          },
        },
      },
    };
  }
}
