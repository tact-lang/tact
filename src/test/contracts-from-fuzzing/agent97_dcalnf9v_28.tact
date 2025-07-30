struct InnerStruct {
  i: Int;
}

struct MidStruct {
  m: InnerStruct;
}

struct TopStruct {
  t: MidStruct;
}

contract ThreeLevels {
  val: TopStruct;
  init() {
    self.val = TopStruct{ t: MidStruct{ m: InnerStruct{ i: 123 } } };
  }
}