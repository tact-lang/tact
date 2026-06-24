// Compose nested struct with multiple string fields
struct ManyStrings {
  a: String;
  b: String;
  c: String;
  d: String;
  e: String;
}

contract LotsOfStrings {
  strs: ManyStrings;
  init() {
    self.strs = ManyStrings{
      a: "a",
      b: "b",
      c: "c",
      d: "d",
      e: "e",
    };
  }
}