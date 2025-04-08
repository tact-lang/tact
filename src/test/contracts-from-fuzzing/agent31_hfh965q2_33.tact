struct HasOptionalStr {
  s: String?;
  b: Bool;
}

contract Test {
  data: HasOptionalStr;

  init() {
    self.data = HasOptionalStr{s: null, b: true};
  }
}