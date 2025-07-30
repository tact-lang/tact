struct InnerDefaultOpt {
  a: Int = 1;
  b: Bool?;
}

struct OuterContains {
  foo: InnerDefaultOpt;
}

contract InnerDefaultOptTest {
  v: OuterContains;

  init() {
    self.v = OuterContains{
      foo: InnerDefaultOpt{
        b: null
      }
    };
  }
}
