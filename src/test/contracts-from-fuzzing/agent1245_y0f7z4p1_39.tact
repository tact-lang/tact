struct SOpt2 {
  foo: Int?;
  bar: String?;
}

contract DefaultOptStruct {
  s: SOpt2;

  init() {
    self.s = SOpt2{ foo: null, bar: null };
  }
}
