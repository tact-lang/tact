struct S1 { f: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2; }
struct S4 { s3: S3; }
contract NestedFour {
 a: S4;
 init() {
   self.a = S4{ s3: S3{ s2: S2{ s1: S1{ f: 99 } } } };
 }
}