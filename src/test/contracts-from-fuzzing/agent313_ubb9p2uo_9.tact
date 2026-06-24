struct StringFields {
  s1: String;
  s2: String;
  s3: String?;
}

contract PersistentStrings {
  strdata: StringFields;

  init() {
    self.strdata = StringFields{
      s1: "hello",
      s2: "",
      s3: null
    };
  }
}