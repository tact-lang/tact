struct OptionalString {
  text: String?;
}

struct HasSlice {
  s: Slice;
}

struct TopLevel {
  num: Int;
  opt: OptionalString;
  sliceHolder: HasSlice;
}

contract MixedNested {
  d: TopLevel;

  init() {
    self.d = TopLevel{
      num: 1,
      opt: OptionalString{ text: null },
      sliceHolder: HasSlice{ s: emptyCell().asSlice() },
    };
  }
}