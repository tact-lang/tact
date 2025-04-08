struct Strings {
  a: String;
  b: String;
  c: String;
  d: String;
  e: String;
}

contract LotsOfStrings {
  data: Strings;

  init() {
    self.data = Strings{
      a: "a",
      b: "b",
      c: "c",
      d: "d",
      e: "e",
    };
  }
}