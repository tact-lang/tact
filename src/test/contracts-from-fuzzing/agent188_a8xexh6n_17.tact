struct S {
  a: Int as int4;
  b: Int as uint4;
}

contract SerializationMix {
  s: S;

  init() {
    self.s = S { a: -7, b: 8 };
  }
}