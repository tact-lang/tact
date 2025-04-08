struct NestedOptionals {
  innerOpt: Int?;
}

contract Opts {
  o1: NestedOptionals?;
  o2: Int?;
  o3: Bool?;

  init() {
    self.o1 = null;
    self.o2 = null;
    self.o3 = null;
  }
}