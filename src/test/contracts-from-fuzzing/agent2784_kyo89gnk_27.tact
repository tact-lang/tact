struct InnerOpt {
  a: Int?;
}

struct OuterOpt {
  nested: InnerOpt?;
  b: Bool;
}

contract OptionalInOptional {
  val: OuterOpt;

  init() {
    self.val = OuterOpt{
      nested: null,
      b: true
    };
  }
}