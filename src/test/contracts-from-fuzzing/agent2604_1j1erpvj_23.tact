struct OptionalChainInner {
  foo: Int?;
  bar: String?;
}

struct OptionalChain {
  nested: OptionalChainInner;
}

contract OptionalChainTest {
  val: OptionalChain;

  init() {
    self.val = OptionalChain{
      nested: OptionalChainInner{
        foo: null,
        bar: null
      }
    };
  }
}