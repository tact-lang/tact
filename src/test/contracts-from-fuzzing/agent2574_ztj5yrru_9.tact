struct S1 { a: Int }
struct S2 { x: S1 }
struct S3 { y: S2 }

contract ChainNest {
  data: S3;

  init() {
    self.data = S3{
      y: S2{
        x: S1{ a: 777 }
      }
    };
  }
}