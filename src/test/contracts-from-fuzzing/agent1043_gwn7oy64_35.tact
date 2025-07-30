// Different serialization of ints
struct S {
  a: Int as int64;
  b: Int as uint32;
  c: Int as int8;
  d: Int;
}

contract TestContract {
  s: S;

  init() {
    self.s = S{ a: 5, b: 100, c: -8, d: 90 };
  }
}