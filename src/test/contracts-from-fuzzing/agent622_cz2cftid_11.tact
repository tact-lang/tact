struct S1 { a: Int = 1; }
struct S2 { b: Bool = false; }
struct S3 { c: String = "hi"; }

contract ManyStructs {
  s1: S1 = S1{};
  s2: S2 = S2{};
  s3: S3 = S3{};
  init() {}
}