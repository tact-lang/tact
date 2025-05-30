struct NestedOpt {
  lv1: Int?;
  lv2: Int?;
}

struct Container {
  innerOpt: NestedOpt?;
}

contract OptionalSubStructs {
  data: Container;

  init() {
    self.data = Container{
      innerOpt: NestedOpt{
        lv1: 123,
        lv2: null
      }
    };
  }
}
