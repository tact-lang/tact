struct StringsDefaults {
  s1: String = "abc";
  s2: String;
  s3: String?;
}

contract StringsDefaultsContract {
  strData: StringsDefaults;

  init() {
    self.strData = StringsDefaults{
      s2: "def",
      s3: null
    };
  }
}