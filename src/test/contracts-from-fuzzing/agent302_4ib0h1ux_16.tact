struct DeepOpt {
  inner: InnerOpt?;
}

struct InnerOpt {
  text: String?;
  number: Int?;
}

contract OptChain {
  val: DeepOpt;

  init() {
    self.val = DeepOpt{
      inner: InnerOpt{
        text: null,
        number: 42
      }
    };
  }
}