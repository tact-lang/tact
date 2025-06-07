struct OptionalInner {
  opt: Inner?;
}

struct Inner {
  x: Int;
  y: Bool;
}

contract OptInnerTest {
  data: OptionalInner;

  init() {
    self.data = OptionalInner{
      opt: Inner{
        x: 1,
        y: true
      }
    };
  }
}