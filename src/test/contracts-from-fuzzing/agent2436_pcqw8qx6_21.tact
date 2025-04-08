struct HasString {
  s: String;
}

contract StringField {
  f: HasString;

  init() {
    self.f = HasString{s:"hello tact"};
  }
}