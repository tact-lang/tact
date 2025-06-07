struct Inner {
  flag: Bool;
  amount: Int as coins;
  nickname: String;
}

struct Wrapper {
  wrapped: Inner;
  extra: Int;
}

contract StructWithNestedStructOpt {
  opt: Wrapper?;
  init() {
    self.opt = null;
  }
}