struct Child {
  val: Int;
}

struct Parent {
  childOpt: Child?;
}

contract OptionalStructInsideStruct {
  data: Parent;

  init() {
    self.data = Parent{
      childOpt: null
    };
  }
}
