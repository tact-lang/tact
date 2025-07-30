struct S1 {
  a: Int;
}
struct S2 {
  a: Int;
  s1: S1;
}
struct S3 {
  a: Int;
  s2: S2;
}
contract DeepNesting {
  deep: S3;

  init() {
    self.deep = S3{
      a: 1,
      s2: S2{
        a: 2,
        s1: S1{
          a: 3,
        },
      },
    };
  }
}