struct S {
  a: Int as uint32;
  b: Int as int64;
  flag: Bool;
}

contract TestContract {
  s: S;
  init() {
    self.s = S{ a: 123, b: -5000, flag: true };
  }
}