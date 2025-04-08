struct DeepInner { val: Int; }

struct InnerNest {
  deep: DeepInner;
  optDeep: DeepInner?;
}

struct OuterNest {
  inner: InnerNest;
  optInner: InnerNest?;
}

contract NestedStructsTest {
  field: OuterNest;

  init() {
    self.field = OuterNest{
      inner: InnerNest{
        deep: DeepInner{val: 10},
        optDeep: null
      },
      optInner: null
    };
  }
}
