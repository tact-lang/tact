struct S1 { x: Int; }
struct S2 { y: Int; }
struct S3 { z: Int; }

contract ManyStructs {
  s1: S1 = S1{ x: 11 };
  s2: S2 = S2{ y: 22 };
  s3: S3 = S3{ z: 33 };
}