struct S2 {
  b: Bool;
}
struct S3 {
  c: String;
}

struct Main {
  s2opt: S2?;
  s3opt: S3?;
  flag: Bool;
}

contract OptStructs {
  val: Main;

  init() {
    self.val = Main{
      s2opt: null,
      s3opt: null,
      flag: true
    };
  }
}
