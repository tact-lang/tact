struct InnerOpt {
  a: Int?;
  b: Bool?;
}

struct OuterOpt {
  inner: InnerOpt?;
}

contract OptionalStructField {
  val: OuterOpt;

  init() {
    self.val = OuterOpt{
      inner: null
    };
  }
}
