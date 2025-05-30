struct WithEmptyStr {
  a: String = "";
}

contract EmptyStringTest {
  val: WithEmptyStr;

  init() {
    self.val = WithEmptyStr{};
  }
}