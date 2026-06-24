struct DeepNestedOpt {
  inner: InnerOpt?;
}

struct InnerOpt {
  flag: Bool?;
  text: String?;
}

contract DeepOptContract {
    s: DeepNestedOpt;

    init() {
        self.s = DeepNestedOpt{
            inner: null,
        };
    }
}