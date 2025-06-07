struct NestedStr {
  s: String;
}

struct WithStr {
  inner: NestedStr;
}

contract ContractWithStrings {
  s: WithStr;

  init() {
    self.s = WithStr{ inner: NestedStr{ s: "hi" } };
  }
}