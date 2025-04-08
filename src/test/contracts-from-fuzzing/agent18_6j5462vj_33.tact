struct ManyOptional {
  a: Int?;
  b: Int?;
  c: String?;
  d: String?;
  e: Bool?;
  f: Address?;
  g: Cell?;
}

contract OptionalFields {
  data: ManyOptional;

  init() {
    self.data = ManyOptional{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
      g: null
    };
  }
}