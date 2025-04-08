struct StringWrap {
  s: String;
}

struct CellStringNested {
  w1: StringWrap;
  w2: StringWrap;
  another: String;
}

contract ContainsStrings {
  val: CellStringNested;
  init() {
    self.val = CellStringNested{
      w1: StringWrap{ s: "a" },
      w2: StringWrap{ s: "b" },
      another: "c"
    };
  }
}