struct S {
  a: Int;
  b: Bool;
  c: Int as uint8;
  d: Bool?;
  e: String;
  f: Int?;
}

contract MixedSerialization {
  s: S;

  init() {
    self.s = S{
      a: 10, b: true, c: 255, d: null, e: "hello", f: null
    };
  }
}
