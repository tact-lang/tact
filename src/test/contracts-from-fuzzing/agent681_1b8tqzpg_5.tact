struct InnerOpt {
  optInt: Int?;
  optBool: Bool?;
}

struct OuterOpt {
  maybeInner: InnerOpt?;
  name: String;
}

contract OptNested {
  val: OuterOpt;

  init() {
    self.val = OuterOpt{
      maybeInner: null,
      name: "hello"
    };
  }
}