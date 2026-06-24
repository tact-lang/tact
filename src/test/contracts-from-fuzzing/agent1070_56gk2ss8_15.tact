struct Nested {
  val: Int;
}

contract NestedArray {
  s1: Nested;
  s2: Nested;
  s3: Nested;

  init() {
    self.s1 = Nested{ val: 1 };
    self.s2 = Nested{ val: 2 };
    self.s3 = Nested{ val: 3 };
  }
}