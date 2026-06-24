struct Inner {
  a: Int;
}

struct Outer {
  normal: Int;
  optionalInner: Inner?;
}

contract OptionalStructField {
  s: Outer;

  init() {
    self.s = Outer{
      normal: 5,
      optionalInner: null,
    };
  }
}