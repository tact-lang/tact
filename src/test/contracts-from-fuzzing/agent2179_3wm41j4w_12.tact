struct Inner {
  a: Int;
  b: Bool?;
}

struct ComplexNested {
  i1: Inner;
  i2: Inner;
  flag: Bool;
}

contract OptInNested {
  val: ComplexNested;

  init() {
    self.val = ComplexNested{
      i1: Inner{ a:1, b: null },
      i2: Inner{ a:2, b: true },
      flag: false
    };
  }
}