struct EmptyStringStruct {
  a: String = "";
  b: String = "";
}
contract HasEmptyStrings {
  s: EmptyStringStruct;
  init() {
    self.s = EmptyStringStruct{};
  }
}