struct Inner {
  a: Int?;
  b: Int?;
}

struct Wrap {
  data1: Inner;
  data2: Inner;
}

contract MultiOptStruct {
  x: Wrap;
  init() {
    self.x = Wrap{
      data1: Inner{a: null, b: 1},
      data2: Inner{a: 2, b: null}
    };
  }
}