struct OptionChain {
  foo: Foo?;
}

struct Foo {
  bar: Bar?;
}

struct Bar {
  baz: Baz?;
}

struct Baz {
  val: Int;
}

contract OptionalChainTest {
  chain: OptionChain;

  init() {
    self.chain = OptionChain{ foo: null };
  }
}