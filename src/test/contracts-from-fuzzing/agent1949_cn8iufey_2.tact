struct DeepInner {
  z: Int;
  flag: Bool;
}

struct Inner {
  x: Int;
  y: DeepInner;
  s: String?;
  optInner: DeepInner?;
}

contract NestedStructContract {
  data: Inner;
  optionalData: Inner?;

  init() {
    self.data = Inner{
      x: 5,
      y: DeepInner{z: 1, flag: true},
      s: null,
      optInner: null
    };
    self.optionalData = null;
  }
}
