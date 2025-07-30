struct OptString {
  s1: String?;
  s2: String?;
}

contract StringsTest {
  val: OptString;

  init() {
    self.val = OptString{ s1:null, s2:"hello" };
  }
}