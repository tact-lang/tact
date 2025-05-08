struct Tiny {
  a: Int;
  b: Int?;
}

struct TinyWrap {
  x: Tiny;
  y: Tiny;
}

contract TwoTinyStructs {
  inner: TinyWrap;

  init() {
    self.inner = TinyWrap{
      x: Tiny{ a: 1, b: null },
      y: Tiny{ a: 2, b: 22 }
    };
  }
}