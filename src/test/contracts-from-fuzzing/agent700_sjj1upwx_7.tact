struct S1 {
  a: Int;
}

struct S2 {
  s: S1;
  opt: Int?;
}

struct S3 {
  s: S2;
}

struct S4 {
  s: S3;
}

struct S5 {
  s: S4;
}

contract DeepChain {
  val: S5;

  init() {
    self.val = S5{ s: S4{ s: S3{ s: S2{ s: S1{ a: 123 }, opt: null } } } };
  }
}