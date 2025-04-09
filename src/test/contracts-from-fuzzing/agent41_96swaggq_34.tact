struct ChainOptionalDefault {
  a: Int?;
  nest: ChainNested;
}

struct ChainNested {
  b: Int? = null;
}

contract ChainOptDefTest {
  foo: ChainOptionalDefault;

  init() {
    self.foo = ChainOptionalDefault{
      a: null,
      nest: ChainNested{}
    };
  }
}
