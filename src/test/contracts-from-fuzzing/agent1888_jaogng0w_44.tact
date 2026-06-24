struct Inner {
  val: Int?;
}

contract OptTest {
  val: Inner?;

  init() {
    self.val = Inner{ val: 123 };
  }
}
