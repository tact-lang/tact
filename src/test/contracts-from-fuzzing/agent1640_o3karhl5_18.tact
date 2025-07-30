struct ManyStrings {
  a: String;
  b: String;
  c: String;
}

contract ContractManyString {
  m: ManyStrings;

  init() {
    self.m = ManyStrings{
      a: "one",
      b: "two",
      c: "three"
    };
  }
}