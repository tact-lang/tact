struct S1 {
  x: Int;
}

struct S2 {
  z: S1;
}

struct S3 {
  y: S2;
}

contract DeepThreeLevelOption {
  opt: S3?;

  init() {
    self.opt = null;
  }
}