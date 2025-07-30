struct DeepOptional {
  lvl1: Int?;
  lvl2: Int?;
  lvl3: Int?;
}

contract OptInStructs {
  val: DeepOptional?;

  init() {
    self.val = DeepOptional{lvl1:1, lvl2:2, lvl3:3};
  }
}