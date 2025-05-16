struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: Address; }

struct SBig {
  s1: S1;
  s2: S2;
  s3: S3;
  extra: Int?;
  note: String;
}

contract CombineStructs {
  combined: SBig;
  init() {
    self.combined = SBig{
      s1: S1{a:1},
      s2: S2{b:false},
      s3: S3{c:myAddress()},
      extra: null,
      note: "ok",
    };
  }
}