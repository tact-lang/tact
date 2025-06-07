struct S1 {
  a: Int?;
  b: Int;
}

struct S2 {
  c: Bool?;
  d: Bool;
}

struct S3 {
  e: String?;
  f: String;
}

struct Mix {
  s1: S1;
  s2: S2;
  s3: S3;
}

contract NestedMix {
  data: Mix = Mix{
    s1: S1{a:null, b:2},
    s2: S2{c:null, d:true},
    s3: S3{e:null, f:"foo"}
  };
}