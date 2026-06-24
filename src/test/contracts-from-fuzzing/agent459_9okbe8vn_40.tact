struct MultiOptionals {
  a: Int?;
  b: Int?;
  c: Int?;
}

contract MultiOption {
  m: MultiOptionals;

  init() {
    self.m = MultiOptionals{
      a: null,
      b: null,
      c: null
    };
  }
}