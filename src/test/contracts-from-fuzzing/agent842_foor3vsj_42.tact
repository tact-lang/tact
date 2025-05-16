struct InnerOpt {
  foo: Int?;
}

struct OuterOpt {
  innerOpt: InnerOpt?;
}

contract NestedStructOptionalInsideOptional {
  data: OuterOpt?;

  init() {
    self.data = null;
  }

  receive() {
    let _=self.data;
  }
}