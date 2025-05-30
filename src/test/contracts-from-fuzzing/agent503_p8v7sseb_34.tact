struct BoolMix {
  flag1: Bool = true;
  flag2: Bool = false;
  num: Int;
}

contract BoolMixPersist {
  val: BoolMix;

  init() {
    self.val = BoolMix{ num: 88 };
  }
}
