struct SOnlyOptional {
  item: Int?;
  flag: Bool?;
  note: String?;
}

contract OptionalStructTest {
  s: SOnlyOptional;

  init() {
    self.s = SOnlyOptional{
      item: null,
      flag: null,
      note: null
    };
  }
}
