struct OptionalInner {
  x: Int?;
  s: String?;
}

struct WrapOptional {
  inner: OptionalInner?;
  y: Int;
}

contract OptInnerWrap {
  data: WrapOptional;
  init() {
    self.data = WrapOptional{inner:null,y:10};
  }
}