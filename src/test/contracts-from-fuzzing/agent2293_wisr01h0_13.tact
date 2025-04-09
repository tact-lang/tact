struct Strange {
  flag: Bool = true;
  num: Int = 777;
}

contract Defaulted {
  s: Strange;

  init() {
    self.s = Strange{};
  }
}