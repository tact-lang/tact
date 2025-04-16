struct MultiStrings {
  a: String;
  b: String?;
  c: String?;
  d: String;
  e: String?;
}

contract MultiStringsContract {
  val: MultiStrings;
  init() {
    self.val = MultiStrings{
      a: "a",
      b: null,
      c: "c",
      d: "d",
      e: null,
    };
  }
}