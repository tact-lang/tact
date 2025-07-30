struct MultiOptionals {
  a: Bool?;
  b: Int?;
  c: Address?;
  d: String?;
  e: Cell?;
  f: Slice?;
}

contract TestContract {
  data: MultiOptionals;

  init() {
    self.data = MultiOptionals{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
    };
  }
}