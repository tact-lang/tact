struct OptionalWrap {
  opt: Int?;
}

contract OptionalWrapUsage {
  s: OptionalWrap;

  init() {
    self.s = OptionalWrap{opt:null};
  }
}