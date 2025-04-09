struct Mid {
  m: Int;
}

struct Top {
  a: Int;
  b: Mid;
}

contract StructWithStruct {
  top: Top;

  init() {
    self.top = Top {
      a: 7,
      b: Mid { m: 8 }
    };
  }
}