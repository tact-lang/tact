struct HasStr {
  s: String;
}

struct HasOptStr {
  s: String?;
}

contract StringsTest {
  f1: HasStr;
  f2: HasOptStr;
  init() {
    self.f1 = HasStr{s:"aaa"};
    self.f2 = HasOptStr{s:null};
  }
}