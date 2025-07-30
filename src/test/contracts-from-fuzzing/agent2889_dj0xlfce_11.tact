struct Optionals {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Cell?;
  e: Slice?;
}

contract OptStruct {
  data: Optionals;

  init() {
    self.data = Optionals{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null
    };
  }
}