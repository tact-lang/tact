struct InnerOpt {
  inner: Int?;
}

struct OuterOpt {
  nested: InnerOpt?;
}

contract OptInStructs {
  field: OuterOpt;

  init() {
    self.field = OuterOpt{
      nested: null,
    };
  }
}
