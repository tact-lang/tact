struct NestedOpt {
  inside: InnerOpt;
}

struct InnerOpt {
  optInt: Int?;
  optBool: Bool?;
}

contract Test {
  data: NestedOpt?;

  init() {
    self.data = NestedOpt{
      inside: InnerOpt{
        optInt: null,
        optBool: true
      }
    };
  }
}