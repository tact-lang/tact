struct HasString {
  s: String;
}

contract StringField {
  field: HasString;
  
  init() {
    self.field = HasString{s: "hello"};
  }
}