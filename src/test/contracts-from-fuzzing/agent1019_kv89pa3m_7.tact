struct NestedOpt {
  name: String?;
  innerOpt: Bool?;
}

struct Container {
  a: Int;
  b: NestedOpt;
}

contract OptInStruct {
  data: Container;

  init() {
    self.data = Container{ a: -4, b: NestedOpt{ name: null, innerOpt: null } };
  }
}
