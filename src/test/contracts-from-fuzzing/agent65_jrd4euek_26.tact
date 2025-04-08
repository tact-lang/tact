struct OpWrap {
  sub: SubWrap?;
}

struct SubWrap {
  val: Int;
}

contract NullOptStart {
  data: OpWrap;
  init() {
    self.data = OpWrap{ sub: null };
  }
}