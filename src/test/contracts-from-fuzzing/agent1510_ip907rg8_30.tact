struct S {
  x: Int as int64;
}

contract DefaultIntSerialization {
  s: S;

  init() {
    self.s = S{x: 123};
  }
}