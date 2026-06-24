struct S {
  a: Int as int1;
  b: Int as int1;
  c: Int as int1;
}

contract PackedBits {
  s: S;

  init() {
    self.s = S{ a:1, b:0, c:1 };
  }
}