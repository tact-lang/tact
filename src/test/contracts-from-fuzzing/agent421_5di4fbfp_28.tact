struct HasString {
  str: String;
}

contract StringPersist {
  s: HasString;

  init() {
    self.s = HasString{ str: "bananas" };
  }
}