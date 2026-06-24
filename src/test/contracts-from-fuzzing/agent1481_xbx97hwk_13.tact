struct TwoStrings {
  s1: String;
  s2: String;
}

contract StrTest {
  val: TwoStrings;

  init() {
    self.val = TwoStrings{
      s1: "hello",
      s2: "world"
    };
  }
}