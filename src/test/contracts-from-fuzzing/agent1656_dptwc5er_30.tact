struct OptionWrap {
  f: Inner?;
}

struct Inner {
  a: Int;
  b: Bool;
}

contract C2 {
  data: OptionWrap;

  init() {
    self.data = OptionWrap{
      f: null
    };
  }
}
