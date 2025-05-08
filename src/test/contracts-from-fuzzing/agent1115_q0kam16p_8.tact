struct NestedOptional {
  optInner: InnerStruct?;
}

struct InnerStruct {
  num: Int;
  flag: Bool;
}

contract TestContract {
  data: NestedOptional;

  init() {
    self.data = NestedOptional{
      optInner: null
    };
  }
}