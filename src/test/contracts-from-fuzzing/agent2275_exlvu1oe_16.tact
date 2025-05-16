struct BoolWrap {
  b: Bool;
}
struct BoolOptWrap {
  b: Bool?;
}

contract OptBoolFields {
  normal: BoolWrap;
  opt: BoolOptWrap;
  init() {
    self.normal = BoolWrap{ b: true };
    self.opt = BoolOptWrap{ b: null };
  }
}