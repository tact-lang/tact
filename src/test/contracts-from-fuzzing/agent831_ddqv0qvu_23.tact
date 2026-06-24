struct NestedOptional {
  innerOpt: InnerOpt?;
}

struct InnerOpt {
  val: Int?;
  str: String?;
}

contract Test {
  data: NestedOptional;

  init() {
    self.data = NestedOptional{
      innerOpt: InnerOpt{
        val: null,
        str: null
      }
    };
  }
}