struct InnerString {
  s: String;
}

contract StringNested {
  inner: InnerString;

  init() {
    self.inner = InnerString{s:"foo"};
  }
}