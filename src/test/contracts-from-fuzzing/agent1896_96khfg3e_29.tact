struct MultipleStrings {
  a: String;
  b: String;
  c: String;
  d: String;
}

contract ManyStrings {
  content: MultipleStrings;

  init() {
    self.content = MultipleStrings{
      a: "a",
      b: "b",
      c: "c",
      d: "d"
    };
  }
}