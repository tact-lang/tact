struct S {
  x: Int;
}

contract OptOptStructTest {
  optStruct: S?;

  init() {
    self.optStruct = null;
  }
}