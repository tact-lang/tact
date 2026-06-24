struct HasStrs {
  s1: String;
  s2: String;
}
contract Strings {
  data: HasStrs;
  init() {
    self.data = HasStrs{s1:"hello", s2:"world"};
  }
}