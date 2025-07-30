struct NestedStr {
  s1: Int;
  s2: Bool;
}

contract AssignNestedPartial {
  s: NestedStr;

  init() {
    self.s = NestedStr{
      s1: 5,
      s2: true
    };
  }

  receive() {
    let old = self.s;
    self.s = NestedStr{ s1: 99, s2: old.s2 };
  }
}