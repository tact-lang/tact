struct S1 { x: Int; }
struct S2 { y: Int; }
struct S3 {
  s1: S1;
  s2: S2;
}

contract C {
  s: S3 = S3{ s1: S1{ x: 1 }, s2: S2{ y: 2 } };
}
