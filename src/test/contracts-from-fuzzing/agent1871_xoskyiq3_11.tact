struct LongStr {
  s1: String;
  s2: String;
  s3: String;
  s4: String;
}

contract StringTest {
  val: LongStr;

  init() {
    self.val = LongStr{
      s1: "a",
      s2: "b",
      s3: "c",
      s4: "d"
    };
  }
}