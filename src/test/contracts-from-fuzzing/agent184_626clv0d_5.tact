struct L3 {
  num: Int;
}

struct L2 {
  innerOpt: L3?;
  flag: Bool;
}

struct L1 {
  nested: L2;
}

contract DeepOptionals {
  root: L1;

  init() {
    self.root = L1{ nested: L2{ innerOpt: null, flag: false } };
  }
}
