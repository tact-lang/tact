struct OptionalString {
  s: String?;
}

contract OptString {
  data: OptionalString;

  init() {
    self.data = OptionalString{s:null};
  }
}
