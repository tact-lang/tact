struct NestOpt {
  opt: Int?;
}

struct WithNested {
  foo: Int;
  nest: NestOpt?;
}

contract OptionalNested {
  s: WithNested;

  init() {
    self.s = WithNested{
      foo: 1,
      nest: null,
    };
  }
}
