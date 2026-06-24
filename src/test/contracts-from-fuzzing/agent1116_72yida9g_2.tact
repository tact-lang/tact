struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
  e: Slice?;
  f: String?;
}

contract Storage {
  data: ManyOptionals;

  init() {
    self.data = ManyOptionals{
      a: 1,
      b: true,
      c: null,
      d: null,
      e: null,
      f: "test",
    };
  }
}
