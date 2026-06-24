struct DeepOptional {
  p: Int?;
  q: Bool?;
}

struct OuterOpt {
  inner: DeepOptional?;
  flag: Bool;
}

contract NestedOptionals {
  s: OuterOpt;

  init() {
    self.s = OuterOpt{
      inner: null,
      flag: true
    };
  }
}