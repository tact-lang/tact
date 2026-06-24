struct InnerOptional {
  nestedOpt: Int?;
}

struct OuterOptional {
  inner: InnerOptional?;
  flag: Bool;
}

contract NestedOpt {
  data: OuterOptional;

  init() {
    self.data = OuterOptional{
      inner: null,
      flag: true
    };
  }
}