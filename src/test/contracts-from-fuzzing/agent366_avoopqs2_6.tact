struct OptIntString {
  i: Int?;
  s: String?;
}

contract MixedNulls {
  val: OptIntString;
  init() {
    self.val = OptIntString{
      i: null,
      s: null,
    };
  }
}