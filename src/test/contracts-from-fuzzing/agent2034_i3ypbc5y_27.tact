struct S1 {
  a: Int;
  b: Bool;
}
struct S2 {
  s1: S1;
}
struct S3 {
  s2: S2;
}
struct S4 {
  s3: S3;
}
struct S5 {
  s4: S4;
}
contract FiveNest {
  val: S5;
  init() {
    self.val = S5{ s4: S4{ s3: S3{ s2: S2{ s1: S1{a:1,b:true} } } } };
  }
}