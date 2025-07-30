struct StringFields {
  s1: String;
  s2: String;
}

contract TestStrings {
  val: StringFields;

  init() {
    self.val = StringFields{
      s1: "foo",
      s2: "bar"
    };
  }
}