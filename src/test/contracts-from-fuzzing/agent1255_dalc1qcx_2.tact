struct OptNested {
  innerOpt: Int?;
  boolVal: Bool;
}

struct OuterOpt {
  nestedOpt: OptNested?;
  val: Int;
}

contract OptionalNestings {
  data: OuterOpt;

  init() {
    self.data = OuterOpt{
        nestedOpt: null,
        val: 7
    };
  }
}