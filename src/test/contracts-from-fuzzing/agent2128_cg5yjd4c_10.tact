struct NestedManyOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptVars {
  data1: NestedManyOpt?;
  data2: NestedManyOpt?;

  init() {
    self.data1 = null;
    self.data2 = NestedManyOpt{
      a: null,
      b: true,
      c: null
    };
  }
}