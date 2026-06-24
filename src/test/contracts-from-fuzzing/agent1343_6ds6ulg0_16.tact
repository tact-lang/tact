struct InnerMost {
  value: Int;
}

struct InnerOpt {
  inner: InnerMost?;
}

struct OuterOpt {
  lv: InnerOpt?;
}

contract OptionalNest {
  field: OuterOpt;

  init() {
    self.field = OuterOpt{
      lv: null
    };
  }
}
