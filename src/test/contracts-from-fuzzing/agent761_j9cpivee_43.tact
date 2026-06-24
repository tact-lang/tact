struct SubOpt {
  x: Int?;
}

contract OptionalsInStructDefVal {
  a: SubOpt = SubOpt{ x: null };

  init() {
    self.a = SubOpt{ x: 5 };
  }
}