struct StringStruct { s1: String; s2: String; s3: String }

contract TestContract {
  sfield: StringStruct;

  init() {
    self.sfield = StringStruct{
      s1: "abc",
      s2: "def",
      s3: "ghi",
    };
  }
}
