struct S1 { a: Int; }
struct S2 { b: Int; }
struct Wrap {
  sa: S1?;
  sb: S2?;
}

contract MultiOptStructs {
  w: Wrap;

  init() {
    self.w = Wrap{
      sa: null,
      sb: null
    };
  }
}