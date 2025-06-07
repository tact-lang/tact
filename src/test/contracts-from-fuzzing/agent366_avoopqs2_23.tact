struct SemiFilled {
  a: Int?;
  b: Bool?;
  s: String?;
}

contract SemiFilledTest {
  data: SemiFilled;
  init() {
    self.data = SemiFilled{
      a: null,
      b: true,
      s: null
    };
  }
}