struct HasString {
  s: String;
}

contract StringInStruct {
  field: HasString;
  init() {
    self.field = HasString{ s: "Hello" };
  }
}