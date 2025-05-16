struct NestedOptStrings {
  first: String?;
  second: String?;
}

struct LevelWrap {
  nest: NestedOptStrings;
}

contract NestingOptionalStrings {
  lv: LevelWrap;

  init() {
    self.lv = LevelWrap{
      nest: NestedOptStrings{
        first: null,
        second: null
      }
    };
  }

  receive() {
    if (self.lv.nest.first != null) {
      let _ = self.lv.nest.first!!;
    }
  }
}
