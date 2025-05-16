struct HasManyOptions {
  s: String?;
  n: Int?;
  b: Bool?;
  c: Cell?;
  sl: Slice?;
  builder: Builder?;
}

contract OptionalFields {
  data: HasManyOptions;

  init() {
    self.data = HasManyOptions{
      s: null,
      n: null,
      b: true,
      c: null,
      sl: null,
      builder: null
    };
  }
}