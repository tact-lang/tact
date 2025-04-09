struct InnerMost {
  val: Int;
}

struct InnerOptHolder {
  inner: InnerMost?;
}

contract OptionalInnerStruct {
  innerOpt: InnerOptHolder?;

  init() {
    self.innerOpt = null;
  }
}