struct InnerMost {
  x: Int as int32;
}
struct Inner {
  y: Int as int64;
  im: InnerMost;
}

contract DeepSerialize {
  rec: Inner;

  init() {
    self.rec = Inner{
      y:123456,
      im: InnerMost{x:100}
    };
  }
}