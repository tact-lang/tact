// Test contract with a struct containing a string with escape sequences
struct StringEscapeTest {
  val: String;
}

contract EscapeTestContract {
  s: StringEscapeTest;

  init() {
    self.s = StringEscapeTest{
      val: "This is a test: \" \\ \n \t \uFFFF"
    };
  }
}