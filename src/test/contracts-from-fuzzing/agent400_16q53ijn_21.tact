struct S1 {
  a: Int;
  b: String;
  c: Bool;
}
struct S2 {
  s1: S1;
}

struct S3 {
  opt: S2?;
}

contract DeepOptionalWrap {
  v: S3 = S3 { opt: null };
  init() {}
}