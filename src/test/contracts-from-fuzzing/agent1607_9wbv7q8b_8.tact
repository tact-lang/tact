struct InnerOpt {
  m: Int?;
  n: Bool?;
}

struct Outer {
  inner: InnerOpt;
  num: Int;
}

contract NestedPartialOpt {
  data: Outer;

  init() {
    self.data = Outer{
      inner: InnerOpt{ m: 99 },
      num: 42
    };
  }
}
