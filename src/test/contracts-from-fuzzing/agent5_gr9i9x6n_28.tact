struct EmptyStrings {
  a: String;
  b: String;
}

contract EmptyStringFields {
  dat: EmptyStrings;

  init() {
    self.dat = EmptyStrings{
      a: "",
      b: ""
    };
  }

  receive() {
    let _ = self.dat.a;
  }
}
