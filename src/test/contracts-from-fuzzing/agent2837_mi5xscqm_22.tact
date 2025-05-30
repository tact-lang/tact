struct WithConstants {
  a: Int = 1;
  b: Bool = true;
  c: String = "abc";
}

contract TestConstants {
  val: WithConstants;
  init() {
    self.val = WithConstants{};
  }
}