struct StringWrap {
  s: String;
}

struct BoolWrap {
  b: Bool;
}

contract ManyTypes {
  sa: StringWrap;
  ba: BoolWrap;

  init() {
    self.sa = StringWrap{s: "x"};
    self.ba = BoolWrap{b:true};
  }
}