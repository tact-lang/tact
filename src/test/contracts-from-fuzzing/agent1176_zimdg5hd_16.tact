struct S1 { a: Int; }
struct S2 { b: String?; }

struct Mix {
  x: Int;
  y: Bool?;
  inner1: S1;
  inner2: S2?;
  z: String;
}

contract MixStructTest {
  m: Mix;

  init() {
    self.m = Mix{
      x: 1,
      y: null,
      inner1: S1{ a: 42 },
      inner2: null,
      z: "done"
    };
  }
}