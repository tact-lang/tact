struct S1 {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
}

struct S2 {
  s1a: S1;
  s1b: S1;
  e: Bool?;
}

struct S3 {
  s2a: S2;
  s2b: S2;
  s2c: S2;
}

contract BigNested {
  data: S3;

  init() {
    self.data = S3{
      s2a: S2{
        s1a: S1{ a: 1, b: true, c: "a", d: myAddress() },
        s1b: S1{ a: 2, b: false, c: "b", d: myAddress() },
        e: null,
      },
      s2b: S2{
        s1a: S1{ a: 3, b: true, c: "c", d: myAddress() },
        s1b: S1{ a: 4, b: false, c: "d", d: myAddress() },
        e: true,
      },
      s2c: S2{
        s1a: S1{ a: 5, b: true, c: "e", d: myAddress() },
        s1b: S1{ a: 6, b: false, c: "f", d: myAddress() },
        e: null,
      }
    };
  }
}