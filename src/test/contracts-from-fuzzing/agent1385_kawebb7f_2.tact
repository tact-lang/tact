struct DeepNested {
  sub: NestedOpt;
}

struct NestedOpt {
  val1: Int?;
  val2: Bool?;
  val3: String?;
}

contract TestContract {
  deep: DeepNested;

  init() {
    self.deep = DeepNested{
      sub: NestedOpt{
        val1: null,
        val2: null,
        val3: null,
      }
    };
  }
}