struct ExtraNested {
  foo: Int;
}

struct Nested {
  ex: ExtraNested;
}

contract DefaultsPersists {
  n: Nested = Nested{ ex: ExtraNested{ foo: 9 } };

  init() {
    self.n = Nested{ ex: ExtraNested{ foo: 19 } };
  }
}