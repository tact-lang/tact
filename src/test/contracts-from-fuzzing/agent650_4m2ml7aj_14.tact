// Multiple nested structs, some with defaults
struct S1 {
  a: Int = 42;
  b: Bool;
}

struct S2 {
  s1: S1;
  s1Opt: S1?;
}

struct S3 {
  s2: S2;
}

contract TestContract {
  deep: S3;

  init() {
    self.deep = S3{
      s2: S2{
        s1: S1{ b: true },
        s1Opt: null
      }
    };
  }
}
