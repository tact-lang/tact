struct InnerOpt {
  foo: Int?;
}

struct OuterOpt {
  inner: InnerOpt?;
}

contract TestContract {
  val: OuterOpt;

  init() {
    self.val = OuterOpt{
      inner: null
    };
  }
}