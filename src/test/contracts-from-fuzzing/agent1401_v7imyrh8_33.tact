struct NestedStrings {
  s1: String;
  s2: String?;
}

contract NestedStrTest {
  s: NestedStrings;

  init() {
    self.s = NestedStrings{ s1:"a", s2:null };
  }
}