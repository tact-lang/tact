struct WithStrings {
  a: String;
  b: String;
  c: String;
}

contract TestStrings {
  s: WithStrings;

  init() {
    self.s = WithStrings{
      a: "alpha",
      b: "beta",
      c: "gamma"
    };
  }
}
