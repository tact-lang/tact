struct InnerAnn {
  foo: Int as uint32;
  bar: Bool?;
}

struct WrapAnn {
  inner: InnerAnn;
  count: Int?;
}

contract AnnOptMix {
  data: WrapAnn;

  init() {
    self.data = WrapAnn{ inner: InnerAnn{ foo:123, bar:null }, count:null };
  }
}