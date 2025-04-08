struct S1 { a: Int; }
struct S2 { a: Int; }
struct S3 { s1: S1; s2: S2; }

contract SimilarSubStructs {
  data: S3;

  init() {
    self.data = S3{
      s1: S1{a:1},
      s2: S2{a:2}
    };
  }
}