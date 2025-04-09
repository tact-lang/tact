struct BoolWrap {
  b: Bool;
}
struct StringWrap {
  s: String;
}
struct IntWrap {
  i: Int;
}

contract DiffWrappers {
  b: BoolWrap;
  s: StringWrap;
  i: IntWrap;

  init() {
    self.b = BoolWrap{b:true};
    self.s = StringWrap{s:"hi"};
    self.i = IntWrap{i:777};
  }
}