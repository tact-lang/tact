struct S1 {
  one: Int;
}
struct S2 {
  two: S1;
}
struct S3 {
  three: S2;
}
struct S4 {
  four: S3;
}
struct S5 {
  five: S4;
}

contract Deep5 {
  d: S5;

  init() {
    self.d = S5{
      five: S4{
        four: S3{
          three: S2{
            two: S1{
              one: 123
            }
          }
        }
      }
    };
  }
}
