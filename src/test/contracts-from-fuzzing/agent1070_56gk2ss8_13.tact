struct DeepOpt {
  inner: InnerOpt?;
}

struct InnerOpt {
  foo: Int?;
}

contract DeepOptional {
  val: DeepOpt;

  init() {
    self.val = DeepOpt {
      inner: InnerOpt {
        foo: null
      }
    };
  }
}