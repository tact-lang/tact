struct ComplexNested {
  a: Int;
  b: Bool;
  c: Address;
}

struct MidNested {
  first: ComplexNested;
  second: ComplexNested;
  third: Int?;
}

contract ManyNested {
  info: MidNested;

  init() {
    self.info = MidNested{
      first: ComplexNested{ a: 1, b: true, c: myAddress() },
      second: ComplexNested{ a: 2, b: false, c: myAddress() },
      third: null,
    };
  }
}