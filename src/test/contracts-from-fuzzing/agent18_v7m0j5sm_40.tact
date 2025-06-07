struct InnerOpt {
  a: Int?;
  b: Int;
}

contract StructOptCombo {
  data: InnerOpt;

  init() {
    self.data = InnerOpt{ a:null, b:123 };
  }
}