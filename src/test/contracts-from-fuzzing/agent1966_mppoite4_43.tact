struct StrWrap { s: String; }

struct Mid {
  a: StrWrap;
  b: StrWrap;
}

contract LabelDupStrStructs {
  store: Mid;

  init() {
    self.store = Mid{
      a: StrWrap{ s: "str1" },
      b: StrWrap{ s: "str2" }
    };
  }
}