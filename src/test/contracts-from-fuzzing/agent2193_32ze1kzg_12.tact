struct StringStruct {
  s1: String;
  s2: String;
  s3: String;
}

contract TestContract {
  texts: StringStruct;

  init() {
    self.texts = StringStruct{
      s1:"one",
      s2:"two",
      s3:"three"
    };
  }
}