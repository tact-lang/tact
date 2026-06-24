struct DeepRemaining {
  a: Int;
  rest: Slice as remaining;
}

struct NestedRem {
  first: DeepRemaining;
  second: Slice as remaining;
}

contract ChainRemaining {
  rec: NestedRem;
  init() {
    self.rec = NestedRem {
      first: DeepRemaining { a: 42, rest: emptyCell().asSlice() },
      second: emptyCell().asSlice(),
    };
  }
}