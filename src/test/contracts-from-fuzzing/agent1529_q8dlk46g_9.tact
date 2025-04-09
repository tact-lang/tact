struct NestedOptionals {
  innerOpt: InnerOpt?;
}

struct InnerOpt {
  a: Int?;
  s: String?;
}

contract NestOptsTest {
  data: NestedOptionals;

  init() {
    self.data = NestedOptionals{
      innerOpt: InnerOpt{
        a: null,
        s: null
      }
    };
  }
}
