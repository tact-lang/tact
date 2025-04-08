struct DeepOptionals {
  nested: InnerOpt?;
}

struct InnerOpt {
  maybeStr: String?;
  maybeBool: Bool?;
}

contract OptNested {
  data: DeepOptionals;

  init() {
    self.data = DeepOptionals{
      nested: InnerOpt{
        maybeStr: null,
        maybeBool: true
      }
    };
  }
}