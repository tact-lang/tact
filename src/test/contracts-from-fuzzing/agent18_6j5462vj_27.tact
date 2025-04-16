struct StrWrap {
  a: String;
  b: String?;
}

contract BigStringOpt {
  val: StrWrap;

  init() {
    self.val = StrWrap{
      a: "hello",
      b: null
    };
  }
}