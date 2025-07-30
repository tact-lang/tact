struct InnerDeep {
  deepValue: Int;
}

struct Middle {
  midOpt: InnerDeep?;
  flag: Bool;
}

contract OptNestedStruct {
  data: Middle;

  init() {
    self.data = Middle{
      midOpt: null,
      flag: true,
    };
  }
}
