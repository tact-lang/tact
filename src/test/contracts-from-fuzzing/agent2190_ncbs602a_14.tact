struct HasString {
  a: String;
  b: String;
  c: String;
}

contract ManyStrings {
  strdata: HasString;

  init() {
    self.strdata = HasString{
      a: "a",
      b: "b",
      c: "c"
    };
  }
}