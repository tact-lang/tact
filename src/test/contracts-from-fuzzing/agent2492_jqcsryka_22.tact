struct NestedBool {
  b1: Bool;
  b2: Bool;
  b3: Bool;
}

contract OnlyBools {
  nb: NestedBool;

  init() {
    self.nb = NestedBool{b1:true,b2:false,b3:true};
  }
}