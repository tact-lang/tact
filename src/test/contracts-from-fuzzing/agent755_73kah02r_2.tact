struct MultiOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Slice?;
  g: Bool;
}

contract Test2 {
  val: MultiOptionals;

  init() {
    self.val = MultiOptionals{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
      g: true,
    };
  }
}
