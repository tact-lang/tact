struct WithStrings {
  s1: String;
  s2: String;
  s3: String;
}

contract ContractWithStrings {
  struc: WithStrings;

  init() {
    self.struc = WithStrings{
      s1: "foo",
      s2: "bar",
      s3: "baz",
    };
  }
}