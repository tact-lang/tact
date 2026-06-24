struct TinyInt {
  flag: Int as int1;
}

contract TinyPersist {
  t: TinyInt;
  b: Int as int1;

  init() {
    self.t = TinyInt{ flag: -1 };
    self.b = 0;
  }
}
