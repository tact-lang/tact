struct StringStruct {
  s1: String;
  s2: String;
  s3: String;
}

contract StringFields {
  val: StringStruct;

  init() {
    self.val = StringStruct{ s1:"A", s2:"B", s3:"C" };
  }
}