struct S1 {
  f1: Int;
}

struct S2 {
  nf: Int;
  opt: S1?;
}

struct S3 {
  deep: S2?;
  extra: Bool;
}

contract TestContract {
  data: S3;

  init() {
    self.data = S3 {
      deep: null,
      extra: true,
    };
  }
}