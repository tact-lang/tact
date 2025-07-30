struct SOptOpt {
  a: Int?;
  b: Bool?;
}

struct OuterWrap {
  inner: SOptOpt?;
}

contract NestedOptionals {
  value: OuterWrap;

  init() {
    self.value = OuterWrap{
      inner: null
    };
  }
}