struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
  e: String?;
}

contract OptFieldsContract {
  optFields: ManyOptionals;

  init() {
    self.optFields = ManyOptionals{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
    };
  }
}