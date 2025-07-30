struct TwoOpt {
  a: Int?;
  b: Bool?;
}

contract OptStruct {
  val: TwoOpt;
  init() {
    self.val = TwoOpt{ a: null, b: null };
  }
}