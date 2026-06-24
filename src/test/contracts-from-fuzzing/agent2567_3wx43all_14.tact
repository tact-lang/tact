struct S1 { a: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2; }
contract OptionalDeep {
 opt: S3?;
 init(){
  self.opt = S3{ s2: S2{ s1: S1{ a: 10 } } };
 }
}