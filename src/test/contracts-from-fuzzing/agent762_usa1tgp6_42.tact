struct OptInt {
  i: Int?;
}

struct OptOptInt {
  o: OptInt?;
}

contract NestedOptionalStruct {
  s: OptOptInt;

  init() {
    self.s = OptOptInt { o: null };
  }
}