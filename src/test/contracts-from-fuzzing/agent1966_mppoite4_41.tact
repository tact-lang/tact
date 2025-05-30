struct NullableLevel {
  s: Int?;
  t: String?;
  b: Bool?;
}

contract OptionalsPersistent {
  f: NullableLevel;

  init() {
    self.f = NullableLevel{
      s: null,
      t: null,
      b: null
    };
  }
}
