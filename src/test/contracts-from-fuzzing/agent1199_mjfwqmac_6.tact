struct S1 { f1: Int; }
struct S2 { f2: Bool; }
struct S3 { f3: String; }

struct Combo {
  s1: S1;
  s2: S2;
  s3: S3;
}

contract Test6 {
  combined: Combo;

  init() {
    self.combined = Combo{
      s1:S1{f1:1}, s2:S2{f2:true}, s3:S3{f3:"hi"}
    };
  }
}