struct S1 {
  x: Int;
}
struct S2 {
  y: Int;
}
struct S3 {
  z: Int;
}

contract Test {
  first: S1;
  second: S2;
  third: S3;

  init() {
    self.first = S1{x: 1};
    self.second = S2{y: 2};
    self.third = S3{z: 3};
  }
}