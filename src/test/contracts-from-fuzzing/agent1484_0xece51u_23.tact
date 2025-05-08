struct ContainsString {
  s: String;
}

contract StringField {
  f: ContainsString;

  init() {
    self.f = ContainsString{s: "hello"};
  }
}