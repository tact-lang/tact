struct WithStrings {
  x: String;
  y: String;
  z: String;
}

contract StringsMany {
  s: WithStrings;

  init() {
    self.s = WithStrings{
      x: "one",
      y: "two",
      z: "three"
    };
  }
}
