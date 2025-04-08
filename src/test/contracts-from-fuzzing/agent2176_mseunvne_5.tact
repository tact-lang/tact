struct Mix {
  a: Int;
  b: Bool?;
  c: String;
  d: Bool;
  e: String?;
  f: Int?;
}

contract MixTest {
  m1: Mix;
  m2: Mix;

  init() {
    self.m1 = Mix{
      a: 1, b: true, c: "c1", d: false, e: null, f: 99
    };
    self.m2 = Mix{
      a: 42, b: null, c: "c2", d: true, e: "hello", f: null
    };
  }
}
