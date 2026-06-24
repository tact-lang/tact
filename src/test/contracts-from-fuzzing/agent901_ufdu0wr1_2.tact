struct DeepNested {
  inner1: String;
  inner2: Bool;
  inner3: Int?;
  inner4: InnerMost;
}

struct InnerMost {
  val1: String?;
  val2: Bool;
}

contract TestContract {
  data: DeepNested;

  init() {
    self.data = DeepNested {
      inner1: "test",
      inner2: false,
      inner3: null,
      inner4: InnerMost {
        val1: null,
        val2: true,
      },
    };
  }
}