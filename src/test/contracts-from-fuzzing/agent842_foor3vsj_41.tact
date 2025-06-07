struct InnerOpt {
  foo: Int?;
}

struct OuterOpt {
  bar: InnerOpt?;
}

contract NestedOptionalBug {
  state: OuterOpt;

  init() {
    self.state = OuterOpt{
      bar: null
    };
  }

  receive() {
    let _=self.state;
  }
}