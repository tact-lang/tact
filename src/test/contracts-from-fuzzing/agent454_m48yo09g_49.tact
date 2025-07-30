struct StructA {
  flag: Bool;
}
struct StructB {
  inner: StructA;
}

contract NestedMixed {
  sb: StructB;
  init() {
    self.sb = StructB{ inner: StructA{ flag:true } };
  }
}