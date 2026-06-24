struct S1 {
  a: Int;
  b: Bool;
  c: String;
}

struct S2 {
  d: Int;
  e: Bool;
  f: String;
  g: S1;
}

struct S3 {
  h: Int;
  i: Bool;
  j: String;
  k: S2;
}

contract WideNested {
  state: S3;
  init() {
    self.state = S3{
      h: 10,
      i: true,
      j: "ok",
      k: S2{
        d: 20,
        e: false,
        f: "fine",
        g: S1{
          a: 1,
          b: false,
          c: "yes"
        }
      }
    };
  }
}