struct Chain {
  inner: Inner?
}

struct Inner {
  val: Int;
}

contract OptionalChain {
  ch: Chain;

  init() {
    self.ch = Chain{ inner: null };
  }
}