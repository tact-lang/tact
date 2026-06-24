struct MultiOptionals {
  a: Int?;
  b: Bool?;
  c: Int?;
  d: Bool?;
}

contract OptionalFields {
  data: MultiOptionals;

  init() {
    self.data = MultiOptionals{
      a: null,
      b: true,
      c: 5,
      d: null
    };
  }
}