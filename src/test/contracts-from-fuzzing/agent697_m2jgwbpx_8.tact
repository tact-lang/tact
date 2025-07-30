struct DeepOpt {
  inner: InnerOpt?;
}

struct InnerOpt {
  val: Int?;
}

contract Test {
  field: DeepOpt = DeepOpt{ inner: null };

  init() {
    self.field = DeepOpt{ inner: InnerOpt{ val: 123 } };
  }

  receive() {}
}