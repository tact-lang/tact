struct ManyOptionals {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Bool?;
  e: String?;
  f: Cell?;
}

contract TestManyOptionals {
  data: ManyOptionals;

  init() {
    self.data = ManyOptionals{
      a: null,
      b: 2,
      c: null,
      d: true,
      e: "test",
      f: null
    };
  }
}
