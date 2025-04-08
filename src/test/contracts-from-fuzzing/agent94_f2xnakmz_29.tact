struct InnerS {
  foo: Int;
  bar: Bool?;
}

struct OuterS {
  i1: InnerS;
  i2: InnerS;
}

contract NestedOptionals {
  data: OuterS;

  init() {
    self.data = OuterS{
      i1: InnerS{ foo: 42, bar: null },
      i2: InnerS{ foo: 24, bar: true }
    };
  }
}