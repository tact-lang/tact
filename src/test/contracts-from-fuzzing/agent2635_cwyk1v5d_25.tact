struct InnerStringOpt {
  s: String?;
}

struct NestedInnerOpt {
  inner: InnerStringOpt;
}

contract ComplexStringOpt {
  nested: NestedInnerOpt;

  init(){
    self.nested = NestedInnerOpt{
      inner: InnerStringOpt{
        s: null
      }
    };
  }
}