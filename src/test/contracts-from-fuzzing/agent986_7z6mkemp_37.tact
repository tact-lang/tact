struct Strings {
  s1: String;
  s2: String;
}

struct StringsOpt {
  so1: String?;
  so2: String?;
}

contract StringsCombo {
  a: Strings;
  b: StringsOpt;
  init() {
    self.a = Strings{s1:"a", s2:"b"};
    self.b = StringsOpt{so1:null, so2:null};
  }
}