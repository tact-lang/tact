struct S1 {
  a: Int;
}

struct S2 {
  a: S1;
  b: Int?;
}

struct S3 {
  k: S2;
  z: Bool?;
}

contract Combos {
  data: S3;

  init() {
    self.data = S3{
      k: S2{ a: S1{ a: 42 }, b: null },
      z: true
    };
  }
}