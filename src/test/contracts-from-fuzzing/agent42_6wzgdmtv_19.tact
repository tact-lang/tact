struct S1 { a: Int; b: String; }
struct S2 { s: S1; c: String; d: Int; }
struct S3 { s2: S2; e: Int; }

contract TestContract {
  val: S3;

  init() {
    self.val = S3{
      s2: S2{ s:S1{ a:1, b:"b" }, c:"c", d:2 },
      e:3
    };
  }
}