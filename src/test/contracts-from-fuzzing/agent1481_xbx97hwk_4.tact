struct NestedOptionals {
  inner: InnerOpt;
}

struct InnerOpt {
  x: Int?;
  y: Bool?;
}

contract NestedOptTest {
  nopt: NestedOptionals;

  init() {
    self.nopt = NestedOptionals{
      inner: InnerOpt{ x: null, y: null }
    };
  }
}