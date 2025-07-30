struct S1 { a: Int }
struct S2 { b: Int }
struct S3 { s1: S1; s2: S2 }
struct S4 { s3: S3 }

contract Chains {
  val: S4;
  init() {
    self.val = S4{ s3: S3{ s1: S1{a:1}, s2: S2{b:2} } };
  }
}
