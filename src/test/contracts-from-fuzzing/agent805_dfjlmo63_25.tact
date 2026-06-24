struct DeepWrap {
  a: InnerWrap;
}

struct InnerWrap {
  b: Int;
}

contract PersistedNested {
  x: Int;
  nested: DeepWrap;

  init() {
    self.x = 9;
    self.nested = DeepWrap{ a: InnerWrap{ b:5 } };
  }
}
