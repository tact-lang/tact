struct InnerMost { flag: Bool; num: Int; }

struct Inner {
  val1: Int;
  maybeInnerMost: InnerMost?;
}

struct Outer {
  id: Int;
  inner: Inner;
  optionalInner: Inner?;
}

contract NestedStructsContract {
  data: Outer;
  
  init() {
    self.data = Outer{
      id: 1,
      inner: Inner{
        val1: 2,
        maybeInnerMost: null,
      },
      optionalInner: null,
    };
  }
}