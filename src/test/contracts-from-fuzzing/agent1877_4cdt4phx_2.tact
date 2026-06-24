struct OptionalNested {
  nested: InnerOpt?;
}

struct InnerOpt {
  text: String?;
  active: Bool;
}

contract OptNestedStore {
  val: OptionalNested;

  init() {
    self.val = OptionalNested{
      nested: InnerOpt{
        text: null,
        active: false,
      }
    };
  }
}
