struct OptStr {
  s: String?; 
  b: Bool;
}

contract OptionalStrings {
  data: OptStr;

  init() {
    self.data = OptStr{
      s: null,
      b: true
    };
  }
}
