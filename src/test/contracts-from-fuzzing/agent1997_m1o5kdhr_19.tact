struct ManyStrings {
  a: String;
  b: String = "b";
  c: String;
  d: String = "d";
}

contract Stringy {
  stuff: ManyStrings;

  init() {
    self.stuff = ManyStrings{
      a: "aaa",
      c: "ccc"
    };
  }
}
