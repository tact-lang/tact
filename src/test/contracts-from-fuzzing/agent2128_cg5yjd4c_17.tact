struct S1 {
  x1: Int;
}
struct S2 {
  x2: Int;
  s1: S1;
}
struct S3 {
  x3: Int;
  s2: S2;
}

contract NestThree {
  data: S3;

  init() {
    self.data = S3{
      x3: 30,
      s2: S2{
        x2: 20,
        s1: S1{
          x1: 10
        }
      }
    };
  }
}