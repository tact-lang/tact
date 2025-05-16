struct S1 {
 x: Int;
}
struct S2 {
 y: S1;
}
struct S3 {
 z: S2;
}

contract TestContract {
  s3: S3;

  init() {
    self.s3 = S3{
      z: S2{
        y: S1{
          x: 5
        }
      }
    };
  }
}