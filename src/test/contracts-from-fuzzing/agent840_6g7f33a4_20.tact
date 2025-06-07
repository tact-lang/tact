struct L2 {
  val: Int as uint4;
}

struct L1 {
  flag: Bool?;
  deep: L2;
}

contract ComboNest {
  info: L1;

  init() {
    self.info = L1{
      flag: null,
      deep: L2{ val: 7 }
    };
  }
}
