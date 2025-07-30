struct ManyStrings {
  a: String;
  b: String;
  c: String;
  d: String;
  e: String;
  f: String;
  g: String;
  h: String;
  i: String;
  j: String;
}

contract TestStorage {
  ms: ManyStrings;

  init() {
    self.ms = ManyStrings{
      a: "A", b: "B", c: "C", d: "D", e: "E",
      f: "F", g: "G", h: "H", i: "I", j: "J"
    };
  }
}