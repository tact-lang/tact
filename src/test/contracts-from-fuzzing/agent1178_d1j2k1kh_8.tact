struct StrNest {
  a: String;
  b: String?;
}

struct StrWrap {
  inner: StrNest;
  msg: String;
}

contract Test {
  data: StrWrap;

  init() {
    self.data = StrWrap{
      inner: StrNest{a:"abc", b:null},
      msg: "def",
    };
  }
}