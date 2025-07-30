struct Strings {
  s: String;
  o: String?;
}

contract LongStrings {
  data: Strings;

  init() {
    self.data = Strings {
      s: "hello",
      o: null
    };
  }
}