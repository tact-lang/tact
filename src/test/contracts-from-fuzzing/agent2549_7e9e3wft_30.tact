struct HoldsString {
  str: String;
}

contract StringInside {
  v: HoldsString;

  init() {
    self.v = HoldsString{
      str: "hello"
    };
  }
}