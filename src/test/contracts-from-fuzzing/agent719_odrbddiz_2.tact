struct MultipleOptionals {
  i: Int?;
  b: Bool?;
  c: Cell?;
  s: Slice?;
  str: String?;
  addr: Address?;
}

contract OptionalFields {
  data: MultipleOptionals;

  init() {
    self.data = MultipleOptionals{
      i: null,
      b: null,
      c: null,
      s: null,
      str: null,
      addr: null,
    };
  }
}