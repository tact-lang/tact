struct S1 { a: Int; b: Bool }
struct S2 { s1: S1; s2opt: S1? }
struct S3 { s2: S2; s3opt: S2? }
contract DeepTree {
  data: S3;
  init() {
    self.data = S3{
      s2: S2 { s1: S1{a:1,b:true}, s2opt: null },
      s3opt: null
    };
  }
}