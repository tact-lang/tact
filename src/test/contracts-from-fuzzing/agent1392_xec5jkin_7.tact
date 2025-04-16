struct NestedOptionals {
  innerOpt: Int?;
  optBool: Bool?;
  optString: String?;
}

struct WrapOpt {
  nested: NestedOptionals?;
}

contract OptionalNesting {
  d: WrapOpt;

  init() {
    self.d = WrapOpt{
       nested: null
    };
  }
}