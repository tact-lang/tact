struct S1 {
  x: Int;
}

struct S2 {
  s: S1;
}

struct S3 {
  s: S2;
}

contract SerialNested {
  root: S3;

  init() {
    self.root = S3{
      s: S2{
        s: S1{
          x: 42
        }
      }
    };
  }
}