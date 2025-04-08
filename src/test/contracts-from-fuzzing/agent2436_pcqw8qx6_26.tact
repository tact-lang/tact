struct HasOptStr {
  s: String?;
}

contract OptionalStr {
  f: HasOptStr;

  init() {
    self.f = HasOptStr{s: null};
  }
}