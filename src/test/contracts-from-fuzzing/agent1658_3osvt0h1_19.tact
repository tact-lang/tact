struct S1 {
  a: Int;
  b: String?;
}

struct S2 {
  c: Bool;
  d: S1;
  e: Int?;
}

struct S3 {
  f: S2;
  g: Bool?;
}

contract TripleNestOptional {
  val: S3;

  init() {
    self.val = S3{
      f:S2{ c:true, d:S1{ a:1, b:null }, e:null },
      g:null
    };
  }
}