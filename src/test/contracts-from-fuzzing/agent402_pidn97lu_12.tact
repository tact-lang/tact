struct LongStrings {
  s1: String;
  s2: String;
  s3: String;
}

contract LongStrTest {
  data: LongStrings;

  init() {
    self.data = LongStrings{
      s1: "abcdefghijkl",
      s2: "mnopqrstuvwxyz",
      s3: "1234567890!@#$%^&*()",
    };
  }
}