struct WithStrings {
  a: String;
  b: String;
  c: String;
}

contract ContractWithStrings {
  s: WithStrings;

  init() {
    self.s = WithStrings{
      a: "a",
      b: "b",
      c: "c"
    };
  }
}