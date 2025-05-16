struct ManyOptionals {
  a: Int?;
  b: Bool?;
  s: String?;
  c: Cell?;
  addr: Address?;
}

contract OptionalFields {
  options: ManyOptionals;

  init() {
    self.options = ManyOptionals{
      a: null,
      b: null,
      s: null,
      c: null,
      addr: null,
    };
  }
}
