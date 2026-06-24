struct HasStr {
  s: String;
}

contract OptionalStringStruct {
  s: HasStr?;
  init() {
    self.s = null;
  }
}