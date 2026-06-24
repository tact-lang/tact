struct S1 {
  x: Int;
}

struct S2 {
  y: S1;
}

struct S3 {
  z: S2;
}

contract SerializeOrder {
  myData: S3;

  init() {
    self.myData = S3{
      z: S2{
        y: S1{ x: 42 }
      }
    };
  }
}