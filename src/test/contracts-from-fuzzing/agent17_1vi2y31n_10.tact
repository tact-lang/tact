struct Texts {
  short: String;
  long: String;
}

contract ManyStrings {
  content: Texts;

  init() {
    self.content = Texts{
      short: "hi",
      long: "This is a much longer string to see if anything breaks when storing larger string literals"
    };
  }
}