struct S2 {
  s2val: Int;
}

struct S1 {
  s2: S2;
}

contract OptionalNestedStruct {
  state: S1?;

  init() {
    self.state = S1{
      s2: S2{
        s2val: 42
      }
    };
  }
}