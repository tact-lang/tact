struct S1 {
  i: Int;
  b: Bool;
}
struct S2 {
  s: String;
  s1: S1;
}
struct S3 {
  s2: S2;
  i: Int;
}
contract NestedSevens {
  field: S3;
  init() {
    self.field = S3{s2:S2{s: "hi", s1:S1{i:7,b:true}}, i:42};
  }
}
