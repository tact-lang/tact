struct S1 {
  a: Int;
  b: Bool;
  c: String;
}

struct S2 {
  x: String;
  y: S1;
  z: Bool;
}

struct S3 {
  p: Int;
  q: S2;
}

struct S4 {
  id: Int;
  inner: S3;
}

contract ChainNested {
  data: S4;

  init() {
    self.data = S4{
      id: 100,
      inner: S3{
        p: 99,
        q: S2{
          x: "nested",
          y: S1{ a: 1, b: true, c: "inner" },
          z: false
        }
      }
    };
  }
}
