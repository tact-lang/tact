struct StrNest {
  x: String;
}

struct StrOut {
  nested: StrNest;
}

contract BigString {
  sn: StrOut;

  init() {
    self.sn = StrOut{nested: StrNest{x: "Hello"}};
  }
}