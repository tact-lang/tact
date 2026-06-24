// deeply nested chain with optionals on each level
struct S1 { x: Int?; }
struct S2 { s1: S1?; }
struct S3 { s2: S2?; }
struct S4 { s3: S3?; }

contract TestContract {
  val: S4;

  init() {
    self.val = S4{ s3: S3{ s2: null }};
  }
}