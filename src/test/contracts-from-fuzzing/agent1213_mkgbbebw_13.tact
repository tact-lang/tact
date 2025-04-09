struct S1 {
  aa: Int;
}

struct S2 {
  s: S1;
}

struct S3 {
  s: S2;
}

contract NestedOptionalsInStruct {
  f: S3?;

  init() {
    self.f = null;
  }
}