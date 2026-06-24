struct HasString {
  s: String;
  b: Bool;
}

contract Test {
  data: HasString;

  init() {
    self.data = HasString{s: "hi", b: true};
  }
}