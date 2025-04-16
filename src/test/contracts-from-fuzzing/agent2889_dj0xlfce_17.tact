struct S1 { x: Int; }
struct S2 { y: Bool; }
struct S3 { z: String; }

struct Master {
  a: S1;
  b: S2;
  c: S3;
}

contract MultiStructNest {
  s: Master;

  init() {
    self.s = Master{
      a: S1{ x: 1 },
      b: S2{ y: true },
      c: S3{ z: "test" }
    };
  }
}