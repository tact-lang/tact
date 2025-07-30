struct NestedOptional {
  innerOpt: Int?;
  boolOpt: Bool?;
}

struct Container {
  nested: NestedOptional;
  num: Int;
}

contract TestContract {
  data: Container;

  init() {
    self.data = Container{
      nested: NestedOptional{
        innerOpt: null,
        boolOpt: null,
      },
      num: 100,
    };
  }
}