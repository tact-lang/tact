// intentionally test optional of optional primitive, which is known to be rejected
// but optional of optional struct containing primitive optionals - should work

struct S {
  a: Int?;
}

struct Wr {
  x: S?;
}

contract OptOptStruct {
  w: Wr;

  init() {
    self.w = Wr{
      x: null
    };
  }
}
