struct DeepOptStruct {
  nested: InnerOpt?;
}

struct InnerOpt {
  foo: Int?;
}

contract DeepOptContract {
  data: DeepOptStruct?;

  init() {
    self.data = null;
  }
}