struct HasString {
  s: String;
}

contract StringStorageTest {
  val: HasString;

  init() {
    self.val = HasString{ s: "Hello" };
  }
}
