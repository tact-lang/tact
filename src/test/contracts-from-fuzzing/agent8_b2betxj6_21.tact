struct Chain {
 inner: Inner;
}

struct Inner {
  innerOpt: DeepOpt?;
}

struct DeepOpt {
  foo: Bool;
  bar: Int?;
}

contract AllNestedOptionals {
  top: Chain;

  init() {
    self.top = Chain {
      inner: Inner{
        innerOpt: null,
      }
    };
  }
}