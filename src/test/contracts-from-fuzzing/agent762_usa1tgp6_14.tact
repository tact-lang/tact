struct RecNested {
  optInt: Int?;
  optStr: String?;
}

struct Middle {
  rec: RecNested;
}

contract StructWithInnerOptionals {
  middle: Middle;

  init() {
    self.middle = Middle{
      rec: RecNested{ optInt: null, optStr: null }
    };
  }
}