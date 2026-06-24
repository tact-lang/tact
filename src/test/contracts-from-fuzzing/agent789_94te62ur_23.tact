struct S1 {
  a: Int;
  b: Int;
  c: Int;
}

struct S2 {
  s: S1;
  d: Int;
  e: Int;
  f: Int;
}

struct S3 {
  t: S2;
  g: Int;
  h: Int;
  i: Int;
}

contract BigNest {
  s: S3;

  init() {
    self.s = S3 {
      t: S2 {
        s: S1 { a:1, b:2, c:3 },
        d:4, e:5, f:6 },
      g:7, h:8, i:9
    };
  }
}
