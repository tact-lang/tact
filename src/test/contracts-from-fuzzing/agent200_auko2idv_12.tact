struct ManyStrings {
  a: String;
  b: String;
  c: String;
  d: String;
}

contract StringFields {
  data: ManyStrings;
  init() {
    self.data = ManyStrings{
      a: "one",
      b: "two",
      c: "three",
      d: "four"
    };
  }
}