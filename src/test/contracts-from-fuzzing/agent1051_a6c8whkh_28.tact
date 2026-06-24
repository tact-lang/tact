// complex deeply nested mixed contract
struct S1 {
  x: Int;
  s: String?;
}

struct S2 {
  flag: Bool;
  inner: S1;
}

struct S3 {
  text: String;
  s2: S2;
}

contract TestContract {
  rec: S3;
  init() {
    self.rec = S3{
      text: "go",
      s2: S2{flag: true, inner: S1{x: 17, s: "hi"}}
    };
  }
}