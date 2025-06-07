struct Inner {
  a: Int;
}

struct Outer {
  optionalInner: Inner?;
}

contract NestedStructOpt {
  optStruct: Outer;

  init() {
    self.optStruct = Outer { optionalInner: null };
  }
}