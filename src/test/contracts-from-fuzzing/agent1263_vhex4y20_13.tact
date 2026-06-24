struct ManyOptional {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Slice?;
  e: Cell?;
  f: Address?;
}

contract TestContract {
  m: ManyOptional;

  init() {
    self.m = ManyOptional{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null
    };
  }
}