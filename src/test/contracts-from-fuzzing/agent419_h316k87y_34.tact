// contract with mix of primitives and nested
struct Nested {
  s: String;
  i: Int;
}

contract MixedMix {
  a: Int;
  b: Nested;
  c: String;
  d: Bool;

  init() {
    self.a = 1;
    self.b = Nested{ s:"x", i: 7 };
    self.c = "hi";
    self.d = true;
  }
}