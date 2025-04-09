struct OptInt {
  val: Int?;
}

struct ContainsStruct {
  inner: OptInt;
}

contract Test {
  s: ContainsStruct;
  init() {
    self.s = ContainsStruct{ inner: OptInt{ val: null } };
  }
}