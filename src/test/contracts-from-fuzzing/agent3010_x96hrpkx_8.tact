struct Embedded {
  foo: Int;
}

struct Wrap {
  embedded: Embedded;
}

struct Top {
  wrap: Wrap;
}

contract EmbedChain {
  val: Top;

  init() {
    self.val = Top{ wrap: Wrap{ embedded: Embedded{ foo: 777 } } };
  }
}
