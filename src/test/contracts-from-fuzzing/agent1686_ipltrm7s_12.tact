struct S1 { x: Int; }
struct S2 { s: S1; }
struct S3 { s: S2; }

contract DeepOptional {
  val: S3?;

  init() {
    self.val = null;
  }
}