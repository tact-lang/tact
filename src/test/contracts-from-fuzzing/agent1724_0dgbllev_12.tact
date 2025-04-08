struct S1 {
  x: Int;
}

struct S2 {
  a: S1;
}

struct S3 {
  a: S2;
}

struct S4 {
  a: S3;
}

struct S5 {
  a: S4;
}

contract DeepFive {
  val: S5;
  init() {
    self.val = S5{
      a: S4{ a: S3{ a: S2{ a: S1{ x: 42 } } } }
    };
  }
}