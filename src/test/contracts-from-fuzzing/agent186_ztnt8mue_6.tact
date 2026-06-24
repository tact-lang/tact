struct StringFields {
  s1: String;
  s2: String;
}

contract TestContract {
  info: StringFields;
  init() {
    self.info = StringFields{ s1: "hello", s2: "world" };
  }
}