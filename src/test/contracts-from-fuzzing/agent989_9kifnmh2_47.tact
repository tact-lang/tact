// optional inside outer struct
struct InnerXs {
  opt: Inner?;
}

struct Inner {
  v: Int;
}

contract OptInnerChain {
  foo: InnerXs;
  init() {
    self.foo = InnerXs{ opt: null };
  }
}