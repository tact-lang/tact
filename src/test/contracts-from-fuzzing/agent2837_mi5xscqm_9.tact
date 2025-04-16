struct S1 { a: Int }
struct S2 { b: Int }
struct S3 {
  s1: S1;
  s2: S2;
}

struct S4 {
  embed: S3;
  x: Int;
}

contract TestEmbed {
  val: S4;
  init() {
    self.val = S4{
      embed: S3{ s1:S1{a:1}, s2:S2{b:2}},
      x: 3
    };
  }
}